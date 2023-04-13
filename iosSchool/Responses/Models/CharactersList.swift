//
//  CharactersList.swift
//  iosSchool
//
//  Created by Student 1 on 02.04.2023.
//

import Foundation

struct CharactersList: Decodable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [Character]
}
