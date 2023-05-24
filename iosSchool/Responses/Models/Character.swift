//
//  Character.swift
//  iosSchool
//
//  Created by Student 1 on 31.03.2023.
//

import Foundation

struct Character: Decodable {
    enum Status: String, Decodable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown
    }

    enum Gender: String, Decodable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown
    }

    let id: Int
    let name: String
    let status: Status
    let species: String
    let gender: Gender
    let image: String
    let url: String
}
