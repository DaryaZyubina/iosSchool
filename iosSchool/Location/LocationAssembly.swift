//
//  LocationAssembly.swift
//  iosSchool
//
//  Created by Student 1 on 02.04.2023.
//

import Foundation

protocol LocationAssembly {
    func locationCoordinator() -> LocationCoordinator
    func locationVC() -> LocationViewController
    func locationDataProvider() -> LocationDataProvider
}

extension Assembly: LocationAssembly {

    func locationCoordinator() -> LocationCoordinator {
        LocationCoordinator(asssembly: self, context: .init()) 
    }

    func locationVC() -> LocationViewController {
        .init(dataProvider: locationDataProvider())
    }

    func locationDataProvider() -> LocationDataProvider {
        LocationDataProviderImp(apiClient: apiClient)
    }
}
