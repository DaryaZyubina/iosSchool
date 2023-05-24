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
    var color: UIColor?
    var isCellContainsData: Bool

    init(
        username: String?,
        photoProfile: UIImage?,
        photoHeader: UIImage?,
        lastTimeVisited: String?,
        color: UIColor?,
        isCellContainsData: Bool
    ) {
        self.username = username ?? "Логин пользователя"
        self.photoProfile = photoProfile ?? UIImage(named: "profileHeader")
        self.photoHeader = photoHeader ?? UIImage(named: "header")
        self.lastTimeVisited = lastTimeVisited ?? ".. .. ...."
        self.color = color ?? UIColor(named: "Lilac50")
        self.isCellContainsData = isCellContainsData
    }
}
