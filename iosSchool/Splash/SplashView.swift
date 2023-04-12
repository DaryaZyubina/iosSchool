//
//  SplashView.swift
//  iosSchool
//
//  Created by Student 1 on 12.04.2023.
//

import UIKit

protocol SplashView: UIView {
    func update(with data: SplashViewData)
}

class SplashViewImp: UIView, SplashView {
    func update(with data: SplashViewData) {}
}
