//
//  Assembly.swift
//  iosSchool
//
//  Created by Student 1 on 17.03.2023.
//

import Foundation

class Assembly {

    var apiClient: ApiClient {
        ApiClient()
    }

    func colorGenerator(alpha: Double) -> ColorGenerator {
        colorGenerator(alpha: alpha)        // если одна строчка - ретурн не нужен
    }

    func appCoordinator() -> AppCoordinator {
        AppCoordinator(asssembly: self, context: CoordinatorContext())
    }
}
