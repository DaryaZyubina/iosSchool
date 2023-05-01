//
//  RegCoordinator.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import UIKit

class RegistrationCoordinator: BaseCoordinator<RegistrationCoordinator.Context> {

    struct Context {
        let onRegistrationSuccess: (() -> Void)?
    }

    override func make() -> UIViewController {
        let controller = assembly.registrationVC(onRegistrationSuccess: context.onRegistrationSuccess)
        return controller
    }
}
