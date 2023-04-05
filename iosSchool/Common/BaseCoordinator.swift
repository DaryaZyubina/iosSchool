//
//  BaseCoordinator.swift
//  iosSchool
//
//  Created by Student 1 on 20.03.2023.
//

import UIKit

class BaseCoordinator<Context> {

    let asssembly: Assembly
    let context: Context

    init(asssembly: Assembly, context: Context) {
        self.asssembly = asssembly
        self.context = context
    }

    func make() -> UIViewController {
        fatalError("method is abstract")
    }
}
