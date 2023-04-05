//
//  AuthCoordinator.swift
//  iosSchool
//
//  Created by Student 1 on 20.03.2023.
//

import UIKit

class AuthCoordinator: BaseCoordinator<AuthCoordinator.Context> {

    struct Context {
    }

    override func make() -> UIViewController {
        let controller = asssembly.authVC()
        controller.onOpenRegistratioon = { [weak controller] in
            let coordinator = self.asssembly.registrationCoordinator()
            let registrationVC = coordinator.make()
            registrationVC.modalPresentationStyle = .fullScreen
            controller?.present(registrationVC, animated: true)
        }
        return controller
    }
}
