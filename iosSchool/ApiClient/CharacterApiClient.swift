//
//  CharacterApiClient.swift
//  iosSchool
//
//  Created by Student 1 on 02.04.2023.
//

import Foundation

protocol CharacterApiClient {
    func allCharacters(onRequestCompleted: @escaping (Result<CharactersList, ApiError>) -> Void)

    func singleCharacter(
        url: String,
        onRequestCompleted: @escaping (Result<Character, ApiError>) -> Void
    )

    func getCharacterFromLocation(
        url: String,
        onRequestCompleted: @escaping (Result<CharactersList, ApiError>) -> Void
    )
}

extension ApiClient: CharacterApiClient {

    func allCharacters(onRequestCompleted: @escaping (Result<CharactersList, ApiError>) -> Void) {
        let url = NetworkConstants.URLStrings.characterURL
        performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestCompleted)
    }

    func singleCharacter(
        url: String,
        onRequestCompleted: @escaping (Result<Character, ApiError>) -> Void
    ) {
//        let link = NetworkConstants.URLStrings.characterURL + "/\(url)"
//        performRequest(url: link, data: nil, method: .get, onRequestCompleted: onRequestCompleted)
        performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestCompleted)
    }

    func getCharacterFromLocation(
        url: String,
        onRequestCompleted: @escaping (Result<CharactersList, ApiError>) -> Void
    ) {
        performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestCompleted)
    }

}
