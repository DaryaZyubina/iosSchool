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
        let coordinator = assembly.splashCoordinator { [weak self] in
            self?.startAuth()
        }
        setRoot(viewController: coordinator.make())
    }

    private func startAuth() {
        guard assembly.storageManager.getToken() == nil else {
            setTabVC()
            assembly.storageManager.setDateToProfile()
            return
        }
        let coordinator = assembly.authCoordinator { [weak self] in
            DispatchQueue.main.async {
                self?.setTabVC()
            }
        }
        setRoot(viewController: coordinator.make())
    }

    private func setTabVC() {
        let tabVC = assembly.rootTabBarController()
        let locationCoordinator = assembly.locationCoordinator()
        let profileCoordinator = assembly.profileCoodrinator { [weak self] in
            self?.assembly.storageManager.removeToken()
            DispatchQueue.main.async {
                self?.startAuth()
            }
        }

        let locationVC = locationCoordinator.make()
        let profieVC = profileCoordinator.make()

        let navVC = assembly.rootNavigationController()
        navVC.setViewControllers([locationVC], animated: false)

        navVC.tabBarItem = RootTab.locations.tabBarItem
        profieVC.tabBarItem = RootTab.profile.tabBarItem

        tabVC.setViewControllers([navVC, profieVC], animated: false)
        setRoot(viewController: tabVC)
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()

    }
}
