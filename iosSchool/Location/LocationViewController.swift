//
//  LocationViewController.swift
//  iosSchool
//
//  Created by Student 1 on 02.04.2023.
//

import UIKit

class LocationViewController: UIViewController {

    private let dataProvider: LocationDataProvider

    init(dataProvider: LocationDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataProvider.allLocations() { [weak self] result in
            switch result {
            case .success(let success):
                print(result)
            case .failure(let failure):
                print(failure.rawValue)
            }
        }
    }
}
