//
//  ProfileViewController.swift
//  iosSchool
//
//  Created by Student 1 on 10.04.2023.
//

import UIKit
import SPIndicator

class ProfileViewController<View: ProfileView>: BaseViewController<View> {

    private var profile: ProfileViewData
    private let dataProvider: ProfileDataProvider

    init(dataProvider: ProfileDataProvider, profile: ProfileViewData) {
        self.dataProvider = dataProvider
        self.profile = profile
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.makeView()
        rootView.update(data: profile)
    }
}
