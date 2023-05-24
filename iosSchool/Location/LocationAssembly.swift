//
//  LocationAssembly.swift
//  iosSchool
//
//  Created by Student 1 on 02.04.2023.
//

import Foundation

protocol LocationAssembly {
    func locationCoordinator() -> LocationCoordinator
    func locationVC() -> LocationViewController<LocationViewImp>
    func locationDataProvider() -> LocationDataProvider
}

extension Assembly: LocationAssembly {

    func locationCoordinator() -> LocationCoordinator {
        LocationCoordinator(assembly: self, context: .init())
    }

    func locationVC() -> LocationViewController<LocationViewImp> {
        .init(dataProvider: locationDataProvider())
    }

    func locationDataProvider() -> LocationDataProvider {
        LocationDataProviderImp(apiClient: apiClient)
    }
}
