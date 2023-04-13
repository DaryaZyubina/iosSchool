//
//  AuthViewController.swift
//  iosSchool
//
//  Created by Student 1 on 20.03.2023.
//

import UIKit

class AuthViewController<View: AuthView>: BaseViewController<View> {

    var onLoginSucceess: (() -> Void)?
    var onOpenRegistratioon: (() -> Void)?

    private let dataProvider: AuthDataProvider

    init(dataProvider: AuthDataProvider, onLoginSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.onLoginSucceess = onLoginSuccess

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.update(with: AuthViewData())
        rootView.registrationAction = onOpenRegistratioon
        rootView.delegate = self

    }
}

// MARK: - AuthViewDelegate

extension AuthViewController: AuthViewDelegate {
    func loginButtonDidTap(login: String, password: String) {
        dataProvider.authorization(username: login, password: password) { [weak self] result in
            switch result {
            case .success(let success):
                print("Success!")
                self?.onLoginSucceess?()
            case .failure(let failure):
                print(failure.rawValue)
            }
        }
    }
}
