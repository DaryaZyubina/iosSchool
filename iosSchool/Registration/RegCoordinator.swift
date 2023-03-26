//
//  RegCoordinator.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import UIKit

class RegCoordinator: BaseCoordinator<RegCoordinator.Context> {

    struct Context {
    }

    override func make() -> UIViewController {
        let controller = asssembly.regVC()
        return controller
    }
}
