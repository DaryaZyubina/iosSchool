//
//  ProfileViewController.swift
//  iosSchool
//
//  Created by Student 1 on 10.04.2023.
//

import UIKit
import SPIndicator

class ProfileViewController<View: ProfileView>: BaseViewController<View> {

    private let dataProvider: ProfileDataProvider

    init(dataProvider: ProfileDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
}
