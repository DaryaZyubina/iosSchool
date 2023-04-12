//
//  ProfileCoordinator.swift
//  iosSchool
//
//  Created by Student 1 on 10.04.2023.
//

import UIKit

class ProfileCoordinator: BaseCoordinator<ProfileCoordinator.Context> {

    struct Context {
    }

    override func make() -> UIViewController {
        let controller = assembly.profileVC()
        return controller
    }
}
