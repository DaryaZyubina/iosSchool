//
//  AuthViewController.swift
//  iosSchool
//
//  Created by Student 1 on 20.03.2023.
//

import UIKit
import SPIndicator
import PKHUD

class AuthViewController<View: AuthView>: BaseViewController<View> {

    var onLoginSucceess: (() -> Void)?
    var onOpenRegistratioon: (() -> Void)?

    private let dataProvider: AuthDataProvider
    private let storageManager: StorageManager

    init(dataProvider: AuthDataProvider, storageManager: StorageManager, onLoginSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.storageManager = storageManager
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
        HUD.show(.progress)
        dataProvider.authorization(username: login, password: password) { [weak self] result in
            DispatchQueue.main.async {
                HUD.hide()
            }
            switch result {
            case .success(let token):
                self?.storageManager.safeToken(token: token)
                self?.onLoginSucceess?()
            case .failure:
                DispatchQueue.main.async {
                    SPIndicator.present(title: "Ошибка авторизации", preset: .error, haptic: .error)
                }
            }
        }
    }
}
