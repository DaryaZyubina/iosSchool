//
//  ProfileAssembly.swift
//  iosSchool
//
//  Created by Student 1 on 10.04.2023.
//

import UIKit

protocol ProfileAssembly {
    func profileCoodrinator() -> ProfileCoordinator
    func profileVC() -> ProfileViewController
}

extension Assembly: ProfileAssembly {

    func profileCoodrinator() -> ProfileCoordinator {
        ProfileCoordinator(assembly: self, context: .init())
    }

    func profileVC() -> ProfileViewController {
        .init()
    }
}
