//
//  LocationApiClient.swift
//  iosSchool
//
//  Created by Student 1 on 02.04.2023.
//

import Foundation

protocol LocationApiClient {
    func allLocations(onRequestCompleted: @escaping (Result<LocationsList, ApiError>) -> Void)
}

extension ApiClient: LocationApiClient {
    func allLocations(onRequestCompleted: @escaping (Result<LocationsList, ApiError>) -> Void) {
        let url = NetworkConstants.URLStrings.locationURL
        performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestCompleted)
    }
}
