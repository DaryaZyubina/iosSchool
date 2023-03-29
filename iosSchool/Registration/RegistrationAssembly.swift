//
//  RegAssembly.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import Foundation

protocol RegistrationAssembly {
    func regCoordinator() -> RegistrationCoordinator
    func regVC() -> RegistrationViewController
    func regDataProvider() -> RegistrationDataProvider
}

extension Assembly: RegistrationAssembly {

    func regCoordinator() -> RegistrationCoordinator {
        RegistrationCoordinator(asssembly: self, context: .init())
    }

    func regVC() -> RegistrationViewController {
        .init(dataProvider: regDataProvider())
    }

    func regDataProvider() -> RegistrationDataProvider {
        RegistrationDataProviderImp()
    }
}
