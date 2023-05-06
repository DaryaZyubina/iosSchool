//
//  ProfileDataProvider.swift
//  iosSchool
//
//  Created by Student 1 on 30.04.2023.
//

import Foundation

protocol ProfileDataProvider {
    func getProfile(
        profileId: String?,
        completion: @escaping (Result<Profile, ApiError>) -> Void
    )
}

class ProfileDataProviderImp: ProfileDataProvider {
    private let apiClient: ProfileApiClient

    init(apiClient: ProfileApiClient) {
        self.apiClient = apiClient
    }

    func getProfile(
        profileId: String?,
        completion: @escaping (Result<Profile, ApiError>) -> Void
    ) {
        apiClient.getProfile(profileId: profileId) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
