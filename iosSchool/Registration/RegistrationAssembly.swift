//
//  RegAssembly.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import Foundation

protocol RegistrationAssembly {
    func registrationCoordinator(onRegistrationSuccess: (() -> Void)?) -> RegistrationCoordinator
    func registrationVC(onRegistrationSuccess: (() -> Void)?) -> RegistrationViewController<RegistrationViewImp>
    func registrationDataProvider() -> RegistrationDataProvider
}

extension Assembly: RegistrationAssembly {

    func registrationCoordinator(onRegistrationSuccess: (() -> Void)?) -> RegistrationCoordinator {
        RegistrationCoordinator(assembly: self, context: .init(onRegistrationSuccess: onRegistrationSuccess))
    }

    func registrationVC(onRegistrationSuccess: (() -> Void)?) -> RegistrationViewController<RegistrationViewImp> {
        .init(
            dataProvider: registrationDataProvider(),
            profileDataProvider: profileDataProvider(),
            storageManager: storageManager,
            onRegistrationSuccess: onRegistrationSuccess
        )
    }

    func registrationDataProvider() -> RegistrationDataProvider {
        RegistrationDataProviderImp(apiClient: apiClient)
    }
}
