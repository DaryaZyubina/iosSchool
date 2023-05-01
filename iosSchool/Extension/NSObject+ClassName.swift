//
//  NSObject+ClassName.swift
//  iosSchool
//
//  Created by Student 1 on 14.04.2023.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: Self.self)
    }
}
