//
//  AuthCoordinator.swift
//  iosSchool
//
//  Created by Student 1 on 20.03.2023.
//

import UIKit

class AuthCoordinator: BaseCoordinator<AuthCoordinator.Context> {

    struct Context {
        let onLoginSuccess: (() -> Void)?
    }

    override func make() -> UIViewController {
        let controller = assembly.authVC(onLoginSuccess: context.onLoginSuccess)
        controller.onOpenRegistratioon = { [weak controller] in
            let coordinator = self.assembly.registrationCoordinator()
            let registrationVC = coordinator.make()
            registrationVC.modalPresentationStyle = .fullScreen
            controller?.present(registrationVC, animated: true)
        }
        return controller
    }
}
