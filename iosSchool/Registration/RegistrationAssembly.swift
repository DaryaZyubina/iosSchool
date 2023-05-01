//
//  RegAssembly.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import Foundation

protocol RegistrationAssembly {
    func registrationCoordinator() -> RegistrationCoordinator
    func registrationVC() -> RegistrationViewController<RegistrationViewImp>
    func registrationDataProvider() -> RegistrationDataProvider
}

extension Assembly: RegistrationAssembly {

    func registrationCoordinator() -> RegistrationCoordinator {
        RegistrationCoordinator(assembly: self, context: .init())
    }

    func registrationVC() -> RegistrationViewController<RegistrationViewImp> {
        .init(
            dataProvider: registrationDataProvider(),
            profileDataProvider: profileDataProvider(),
            storageManager: storageManager
        )
    }

    func registrationDataProvider() -> RegistrationDataProvider {
        RegistrationDataProviderImp(apiClient: apiClient)
    }
}
