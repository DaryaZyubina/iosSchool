//
//  AuthAssembly.swift
//  iosSchool
//
//  Created by Student 1 on 20.03.2023.
//

import Foundation

protocol AuthAssembly {
    func authCoordinator(onLoginSuccess: (() -> Void)?) -> AuthCoordinator
    func authVC(onLoginSuccess: (() -> Void)?) -> AuthViewController<AuthViewImp>
    func authDataProvider() -> AuthDataProvider
}

extension Assembly: AuthAssembly {

    func authCoordinator(onLoginSuccess: (() -> Void)?) -> AuthCoordinator {
        AuthCoordinator(
            assembly: self,
            context: .init(onLoginSuccess: onLoginSuccess)
        )
    }

    func authVC(onLoginSuccess: (() -> Void)?) -> AuthViewController<AuthViewImp> {
        .init(
            dataProvider: authDataProvider(),
            profileDataProvider: profileDataProvider(),
            storageManager: storageManager,
            onLoginSuccess: onLoginSuccess
        )
    }

    func authDataProvider() -> AuthDataProvider {
        AuthDataProviderImp(apiClient: apiClient)
    }
}
