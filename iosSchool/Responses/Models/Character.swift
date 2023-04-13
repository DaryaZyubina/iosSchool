//
//  Character.swift
//  iosSchool
//
//  Created by Student 1 on 31.03.2023.
//

import Foundation

struct Character: Decodable {
    enum Status: Decodable {
        case alive
        case dead
        case unknown
    }

    enum Gender: Decodable {
        case female
        case male
        case genderless
        case unknown
    }

    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: Gender
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
