//
//  ProfileAssembly.swift
//  iosSchool
//
//  Created by Student 1 on 10.04.2023.
//

import Foundation

protocol ProfileAssembly {
    func profileCoodrinator() -> ProfileCoordinator
    func profileVC() -> ProfileViewController<ProfileViewImp>
    func profileDataProvider() -> ProfileDataProvider
}

extension Assembly: ProfileAssembly {

    func profileCoodrinator() -> ProfileCoordinator {
        ProfileCoordinator(assembly: self, context: .init())
    }

    func profileVC() -> ProfileViewController<ProfileViewImp> {
        .init(profile: ProfileViewData(cell: ProfileCellData(
            username: nil,
            photoProfile: nil,
            photoHeader: nil,
            lastTimeVisited: nil,
            isCellContainsData: false
        )))
    }

    func profileDataProvider() -> ProfileDataProvider {
        ProfileDataProviderImp(apiClient: apiClient)
    }
}
