//
//  RegDataProvider.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import Foundation

protocol RegistrationDataProvider {
    func registration(
        username: String,
        password: String,
        completion: @escaping (Result<TokenResponse, ApiError>) -> Void
    )
}

class RegistrationDataProviderImp: RegistrationDataProvider {
    private let apiClient: RegistrationApiClient

    init(apiClient: RegistrationApiClient) {
        self.apiClient = apiClient
    }

    func registration(
        username: String,
        password: String,
        completion: @escaping (Result<TokenResponse, ApiError>) -> Void
    ) {
        apiClient.registration(username: username, password: password) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

