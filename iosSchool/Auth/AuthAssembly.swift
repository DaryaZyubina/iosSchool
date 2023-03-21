//
//  AuthAssembly.swift
//  iosSchool
//
//  Created by Student 1 on 20.03.2023.
//

import Foundation

protocol AuthAssembly {
    func authCoordinator() -> AuthCoordinator
    func authVC() -> AuthViewController
    func authDataProvider() -> AuthDataProvider
}

extension Assembly: AuthAssembly {

    func authCoordinator() -> AuthCoordinator {
        AuthCoordinator(asssembly: self, context: .init())  // .init = AuthCoordinator.Context()
    }

    func authVC() -> AuthViewController {
        .init(dataProvider: authDataProvider())
    }

    func authDataProvider() -> AuthDataProvider {
        AuthDataProviderImp()
    }


}
