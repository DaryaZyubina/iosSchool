//
//  ProfileAssembly.swift
//  iosSchool
//
//  Created by Student 1 on 10.04.2023.
//

import Foundation

protocol ProfileAssembly {
    func profileCoodrinator(exitButtonDidTap: (() -> Void)?) -> ProfileCoordinator
    func profileVC(exitButtonDidTap: (() -> Void)?) -> ProfileViewController<ProfileViewImp>
    func profileDataProvider() -> ProfileDataProvider
}

extension Assembly: ProfileAssembly {

    func profileCoodrinator(exitButtonDidTap: (() -> Void)?) -> ProfileCoordinator {
        ProfileCoordinator(assembly: self, context: .init(exitButtonDidTap: exitButtonDidTap))
    }

    func profileVC(exitButtonDidTap: (() -> Void)?) -> ProfileViewController<ProfileViewImp> {
        .init(
            dataProvider: profileDataProvider(),
            exitButtonDidTap: exitButtonDidTap,
            storageManager: storageManager
        )
    }

    func profileDataProvider() -> ProfileDataProvider {
        ProfileDataProviderImp(apiClient: apiClient)
    }
}
