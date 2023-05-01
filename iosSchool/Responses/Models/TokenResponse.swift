//
//  TokenResponse.swift
//  iosSchool
//
//  Created by Student 1 on 27.03.2023.
//

import Foundation

struct TokenResponse: Decodable {
    let token: String
    let userId: String
}
