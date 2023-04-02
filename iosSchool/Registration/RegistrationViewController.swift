//
//  RegViewController.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import UIKit

class RegistrationViewController: UIViewController {

    private let dataProvider: RegistrationDataProvider

    init(dataProvider: RegistrationDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataProvider.registration(username: "dashad", password: "1111") { [weak self] result in
            switch result {
            case .success(let success):
                print("Registration was successful!")
            case .failure(let failure):
                print(failure.rawValue)
            }
        }
    }
}
