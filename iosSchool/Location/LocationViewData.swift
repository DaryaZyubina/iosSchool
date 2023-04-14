//
//  LocationViewData.swift
//  iosSchool
//
//  Created by Student 1 on 14.04.2023.
//

import Foundation

struct LocationViewData {
    let cellVM: [LocationCellData]

    init(location: LocationsList) {
        cellVM = location.results.map { LocationCellData(
            location: $0,
            population: "Население \($0.residents.count)"
        )}
    }
}
