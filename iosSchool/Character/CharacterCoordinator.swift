//
//  CharacterCoordinator.swift
//  iosSchool
//
//  Created by Student 1 on 02.04.2023.
//

import UIKit

class CharacterCoordinator: BaseCoordinator<CharacterCoordinator.Context> {

    struct Context {
    }

    override func make() -> UIViewController {
        let controller = assembly.characterVC()
        return controller
    }
}
