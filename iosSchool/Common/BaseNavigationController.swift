//
//  BaseNavigationController.swift
//  iosSchool
//
//  Created by Student 1 on 10.04.2023.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.prefersLargeTitles = false
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = .white
    }

    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }
}
