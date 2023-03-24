//
//  AppCoordinator.swift
//  iosSchool
//
//  Created by Student 1 on 20.03.2023.
//

import UIKit

struct CoordinatorContext {}

class AppCoordinator: BaseCoordinator<CoordinatorContext> {

    private var window: UIWindow?

    func start(window: UIWindow) {
        self.window = window
        let coordinator = asssembly.splashCoordinator { [weak self] in
            self?.startAuth()
        }
        setRoot(viewController: coordinator.make())
        // let coordinator = asssembly.authCoordinator()
        // setRoot(viewController: coordinator.make())     // make our viewcontroller
    }

    private func startAuth() {
        let coordinator = asssembly.authCoordinator()
        setRoot(viewController: coordinator.make())
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()

    }

}
