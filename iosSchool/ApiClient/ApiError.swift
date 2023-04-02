//
//  ApiError.swift
//  iosSchool
//
//  Created by Student 1 on 27.03.2023.
//

import Foundation

enum ApiError: Error {
    case dataParsing
    case serverError
    case `default`(Data?)       // "передаваемый параметр"

    var rawValue: String {
        switch self {
        case .dataParsing:
            return "Ошибка парсинга"
        case .serverError:
            return "Ошибка получения данных"
        case let .default(error):
            if let error {
                print(error)
                return String(decoding: error, as: UTF8.self)
            } else {
                return "Неизвестная ошибка"
            }
        }
    }
}
