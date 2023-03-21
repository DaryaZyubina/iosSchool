//
//  SplashAssembly.swift
//  iosSchool
//
//  Created by Student 1 on 20.03.2023.
//

import UIKit

protocol SplashAssembly {
    func splashCoordinator() -> SplashCoordinator
    func splashVC() -> SplashViewController
    func splashDataProvider() -> SplashDataProvider
}

extension Assembly: SplashAssembly {

    func splashCoordinator() -> SplashCoordinator {
        SplashCoordinator(asssembly: self, context: SplashCoordinator.Context())
    }

    func splashVC() -> SplashViewController {
        .init(dataProvider: splashDataProvider())
    }

    func splashDataProvider() -> SplashDataProvider {
        SplashDataProviderImp()
    }


}
