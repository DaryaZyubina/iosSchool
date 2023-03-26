//
//  RegAssembly.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import Foundation

protocol RegAssembly {
    func regCoordinator() -> RegCoordinator
    func regVC() -> RegViewController
    func regDataProvider() -> RegDataProvider
}

extension Assembly: RegAssembly {

    func regCoordinator() -> RegCoordinator {
        RegCoordinator(asssembly: self, context: .init())  // .init = AuthCoordinator.Context()
    }

    func regVC() -> RegViewController {
        .init(dataProvider: regDataProvider())
    }

    func regDataProvider() -> RegDataProvider {
        RegDataProviderImp()
    }
}
