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

        init(from decoder: Decoder) throws {
            let label = try decoder.singleValueContainer().decode(String.self)
            switch label {
                case "Alive": self = .alive
                case "Dead": self = .dead
                default: self = .unknown
            }
        }
    }

    enum Gender: Decodable {
        case female
        case male
        case genderless
        case unknown

        init(from decoder: Decoder) throws {
            let label = try decoder.singleValueContainer().decode(String.self)
            switch label {
                case "Female": self = .female
                case "Male": self = .male
                case "Genderless": self = .genderless
                default: self = .unknown
            }
        }
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

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episode
        case url
        case created
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(Status.self, forKey: .status)
        self.species = try container.decode(String.self, forKey: .species)
        self.type = (try? container.decode(String.self, forKey: .type)) ?? "no type"
        self.gender = try container.decode(Gender.self, forKey: .gender)
        self.origin = try container.decode(Location.self, forKey: .origin)
        self.location = try container.decode(Location.self, forKey: .location)
        self.image = try container.decode(String.self, forKey: .image)
        self.episode = try container.decode([String].self, forKey: .episode)
        self.url = try container.decode(String.self, forKey: .url)
        self.created = try container.decode(String.self, forKey: .created)
    }
}
