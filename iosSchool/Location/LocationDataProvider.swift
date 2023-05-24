//
//  LocationDataProvider.swift
//  iosSchool
//
//  Created by Student 1 on 31.03.2023.
//

import Foundation

protocol LocationDataProvider {
    func allLocations(
        completion: @escaping (Result<LocationsList, ApiError>) -> Void
    )
    func getLocations(
        page: Int,
        onRequestCompleted: @escaping (Result<LocationsList, ApiError>) -> Void
    )
}

class LocationDataProviderImp: LocationDataProvider {
    private let apiClient: LocationApiClient

    init(apiClient: LocationApiClient) {
        self.apiClient = apiClient
    }

    func getLocations(
        page: Int,
        onRequestCompleted: @escaping (Result<LocationsList, ApiError>) -> Void
    ) {
        apiClient.getLocations(page: page) { result in
            switch result {
            case .success(let data):
                onRequestCompleted(.success(data))
            case .failure(let error):
                onRequestCompleted(.failure(error))
            }
        }
    }

    func allLocations(
        completion: @escaping (Result<LocationsList, ApiError>) -> Void
    ) {
        apiClient.allLocations { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
