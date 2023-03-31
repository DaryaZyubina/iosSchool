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
        return controller
    }
}
