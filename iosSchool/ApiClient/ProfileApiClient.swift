//
//  ProfileApiClient.swift
//  iosSchool
//
//  Created by Student 1 on 30.04.2023.
//

import Foundation

protocol ProfileApiClient {
    func getProfile(
        profileId: String?,
        onRequestCompleted: @escaping (Result<Profile, ApiError>) -> Void
    )
}

extension ApiClient: ProfileApiClient {
    func getProfile(
        profileId: String?,
        onRequestCompleted: @escaping (Result<Profile, ApiError>) -> Void
    ) {
        let id = profileId ?? ""
        let url = NetworkConstants.URLStrings.nanoPost + "/v1/profile/\(id)"
        performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestCompleted)
    }
}
