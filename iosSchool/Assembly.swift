//
//  Assembly.swift
//  iosSchool
//
//  Created by Student 1 on 17.03.2023.
//

import UIKit

class Assembly {

    var apiClient: ApiClient {
        ApiClient()
    }

    lazy var imageService: ImageService = ImageServiceImp(apiClient: apiClient)

    func colorGenerator(alpha: Double) -> ColorGenerator {
        colorGenerator(alpha: alpha)        // если одна строчка - ретурн не нужен
    }

    func appCoordinator() -> AppCoordinator {
        AppCoordinator(assembly: self, context: CoordinatorContext())
    }

    func rootTabBarController() -> UITabBarController {
        TabBarController()
    }

    func rootNavigationController() -> UINavigationController {
        let controller = BaseNavigationController()
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
}
