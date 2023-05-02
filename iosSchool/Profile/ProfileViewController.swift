//
//  ProfileViewController.swift
//  iosSchool
//
//  Created by Student 1 on 10.04.2023.
//

import UIKit

class ProfileViewController<View: ProfileView>: BaseViewController<View> {

    private var profile: ProfileCellData

    init(profile: ProfileCellData) {
        self.profile = profile
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.makeView()
        rootView.update(data: ProfileViewData(cell: profile))
    }
}
