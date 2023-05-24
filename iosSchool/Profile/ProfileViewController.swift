//
//  ProfileViewController.swift
//  iosSchool
//
//  Created by Student 1 on 10.04.2023.
//

import UIKit

class ProfileViewController<View: ProfileView>: BaseViewController<View> {

    private var storageManager: StorageManager
    private let dataProvider: ProfileDataProvider
    var exitButtonDidTap: (() -> Void)?

    init(
        dataProvider: ProfileDataProvider,
        exitButtonDidTap: (() -> Void)?,
        storageManager: StorageManager
    ) {
        self.dataProvider = dataProvider
        self.exitButtonDidTap = exitButtonDidTap
        self.storageManager = storageManager

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.makeView()
        rootView.update(data: updateProfile())
        rootView.exitButtonAction = exitButtonDidTap
    }

    private func updateProfile() -> ProfileViewData {
        ProfileViewData(cell: ProfileCellData(
            username: storageManager.getUsername() == nil ? nil : storageManager.getUsername(),
            photoProfile: nil,
            photoHeader: nil,
            lastTimeVisited: storageManager.getProfilesDate() == nil ? nil : storageManager.getProfilesDate(),
            isCellContainsData: false
        ))
    }
}
