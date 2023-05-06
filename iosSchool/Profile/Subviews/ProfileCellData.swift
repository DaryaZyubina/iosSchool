//
//  ProfileCellData.swift
//  iosSchool
//
//  Created by Student 1 on 02.05.2023.
//

import UIKit

class ProfileCellData {
    let username: String?
    let photoProfile: UIImage?
    let photoHeader: UIImage?
    let lastTimeVisited: String?
    var isCellContainsData: Bool

    init(
        username: String?,
        photoProfile: UIImage?,
        photoHeader: UIImage?,
        lastTimeVisited: String?,
        isCellContainsData: Bool
    ) {
        self.username = username ?? "Логин пользователя"
        self.photoProfile = photoProfile ?? UIImage(named: "profileHeader")
        self.photoHeader = photoHeader ?? UIImage(named: "header")
        self.lastTimeVisited = lastTimeVisited ?? ".. .. ...."
        self.isCellContainsData = isCellContainsData
    }
}
