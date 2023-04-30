//
//  ProfileView.swift
//  iosSchool
//
//  Created by Student 1 on 30.04.2023.
//

import UIKit

protocol ProfileView: UIView {}
class ProfileViewImp: UIView, ProfileView {
    func makeView() {}

    // TODO: здесь после добаления 8ой домашки в поле имя профиля буду устанавливать
    // имя профиля из UserDefaults.standard.string(forKey: "NameWithProfile:\(profileId)")
    // time is also gonna be added

}
