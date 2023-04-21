//
//  ProfileViewController.swift
//  iosSchool
//
//  Created by Student 1 on 10.04.2023.
//

import UIKit

class ProfileViewController<View: ProfileView>: BaseViewController<View> {

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.makeView()
    }
}
