//
//  AuthViewController.swift
//  iosSchool
//
//  Created by Student 1 on 20.03.2023.
//

import UIKit

class AuthViewController<View: AuthView>: BaseViewController<View> {

    private let dataProvider: AuthDataProvider

    init(dataProvider: AuthDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.update(with: AuthViewData())
        
        dataProvider.authorization(username: "dasha", password: "1111") {
            [weak self] result in
            switch result {
            case .success(let success):
                print("Success!")
            case .failure(let failure):
                print(failure.rawValue)
            }
        }
    }
}
