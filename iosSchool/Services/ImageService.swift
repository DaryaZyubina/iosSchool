//
//  ImageService.swift
//  iosSchool
//
//  Created by Student 1 on 17.04.2023.
//

import UIKit
import SPIndicator

protocol ImageService {
    func getImage(url: String, completion: @escaping (UIImage?) -> Void)
}

class ImageServiceImp: ImageService {

    private var imageDict: [String: UIImage] = [:]

    private let apiClient: ApiClient
    private let updateQueue = DispatchQueue(label: "ImageServiceQueue")

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {

        if imageDict.count > 50 {
            imageDict.removeAll()
        }

        if let image = imageDict[url] {
            completion(image)
            return
        }

        DispatchQueue.global().async {
            self.apiClient.requestImageData(url: url) { [weak self] result in
                guard let result else {
                    DispatchQueue.main.async {
                        SPIndicator.present(
                            title: "Image load fail",
                            preset: .error,
                            haptic: .error
                        )
                    }
                    return
                }

                guard let image = UIImage(data: result) else {
                    DispatchQueue.main.async {
                        SPIndicator.present(
                            title: "Error while making UIImage from Data",
                            preset: .error,
                            haptic: .error
                        )
                    }
                    return
                }

                self?.updateQueue.async {
                    self?.imageDict.updateValue(image, forKey: url)
                    completion(image)
                }
            }
        }
    }

}
