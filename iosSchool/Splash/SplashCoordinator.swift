//
//  SplashCoordinator.swift
//  iosSchool
//
//  Created by Student 1 on 20.03.2023.
//

import UIKit

class SplashCoordinator: BaseCoordinator<SplashCoordinator.Context> {

    struct Context {
        let onSuccess: (() -> Void)?
    }

    override func make() -> UIViewController {
        let controller = assembly.splashVC(onSuccess: context.onSuccess)
        return controller
    }
}
