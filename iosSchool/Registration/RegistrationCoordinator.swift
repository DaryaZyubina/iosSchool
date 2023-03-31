//
//  RegCoordinator.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import UIKit

class RegistrationCoordinator: BaseCoordinator<RegistrationCoordinator.Context> {

    struct Context {
    }

    override func make() -> UIViewController {
        let controller = asssembly.registrationVC()
        return controller
    }
}
