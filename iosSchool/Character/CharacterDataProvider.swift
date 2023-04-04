//
//  CharacterDataProvider.swift
//  iosSchool
//
//  Created by Student 1 on 02.04.2023.
//

import Foundation

protocol CharacterDataProvider {
    func allCharacters(completion: @escaping (Result<CharactersList, ApiError>) -> Void)

    func singleCharacter(
        id: Int,
        completion: @escaping (Result<Character, ApiError>) -> Void
    )

    func getCharacterFromLocation(
        url: String,
        completion: @escaping (Result<CharactersList, ApiError>) -> Void
    )
}

class CharacterDataProviderImp: CharacterDataProvider {
    private let apiClient: CharacterApiClient

    init(apiClient: CharacterApiClient) {
        self.apiClient = apiClient
    }

    func allCharacters(completion: @escaping (Result<CharactersList, ApiError>) -> Void) {
        apiClient.allCharacters() { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func singleCharacter(
        id: Int,
        completion: @escaping (Result<Character, ApiError>) -> Void
    ) {
        apiClient.singleCharacter(id: id) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getCharacterFromLocation(
        url: String,
        completion: @escaping (Result<CharactersList, ApiError>) -> Void
    ) {
        apiClient.getCharacterFromLocation(url: url) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
