//
//  RegViewController.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import UIKit
import PKHUD
import SPIndicator

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

    private let dataProvider: RegistrationDataProvider
    private let profileDataProvider: ProfileDataProvider
    private let storageManager: StorageManager

    init(
        dataProvider: RegistrationDataProvider,
        profileDataProvider: ProfileDataProvider,
        storageManager: StorageManager
    ) {
        self.dataProvider = dataProvider
        self.profileDataProvider = profileDataProvider
        self.storageManager = storageManager

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.update(with: RegistrationViewData())
    }
}

// MARK: - RegistrationViewDelegate

extension RegistrationViewController: RegistrationViewDelegate {

    func doneButtonDidTap(login: String, passwordFirst: String, passwordSecond: String) {
        HUD.show(.progress)

        guard passwordFirst == passwordSecond else {
            DispatchQueue.main.async {
                SPIndicator.present(
                    title: "Пароли должны совпадать",
                    preset: .error,
                    haptic: .error
                )
                HUD.hide()
            }
            return
        }

        guard login.count >= 3, login.count <= 16 else {
            DispatchQueue.main.async {
                SPIndicator.present(
                    title: "Длина логина должна быть от 3 до 16 символов",
                    preset: .error,
                    haptic: .error
                )
                HUD.hide()
            }
            return
        }

        guard passwordFirst.count >= 8 else {
            DispatchQueue.main.async {
                SPIndicator.present(
                    title: "Длина пароля должна быть не менее 8 символов",
                    preset: .error,
                    haptic: .error
                )
                HUD.hide()
            }
            return
        }

        dataProvider.registration(username: login, password: passwordFirst) { [weak self] result in
            DispatchQueue.main.async {
                HUD.hide()
            }
            switch result {
            case .success(let token):
                self?.storageManager.setDateToProfile()

                self?.profileDataProvider.getProfile(profileId: token.userId) { [weak self] profileResult in

                    switch profileResult {
                    case .success(let profile):
                        self?.storageManager.setUsernameToProfileFromNano(profile: profile)

                    case .failure(let failure):
                        print(failure.rawValue)
                    }
                }

                self?.storageManager.safeToken(token: token)
                // TODO: раскомmентить при слиянии с 6ой домашкой
                // self?.onRegistrationSuccess?()
            case .failure:
                DispatchQueue.main.async {
                    SPIndicator.present(title: "Ошибка регистрации", preset: .error, haptic: .error)
                }
            }
        }
    }

    func cancelButtonDidTap() {
        self.dismiss(animated: true)
    }
}
