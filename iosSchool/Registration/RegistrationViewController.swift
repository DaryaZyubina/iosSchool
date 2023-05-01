//
//  RegViewController.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import UIKit

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

    var onRegistrationSuccess: (() -> Void)?

    private let dataProvider: RegistrationDataProvider

    init(dataProvider: RegistrationDataProvider, onRegistrationSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.onRegistrationSuccess = onRegistrationSuccess

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.update(with: RegistrationViewData())
        rootView.delegate = self
    }
}

// MARK: - RegistrationViewDelegate

extension RegistrationViewController: RegistrationViewDelegate {
    func doneButtonDidTap(login: String, passwordFirst: String, passwordSecond: String) {

        //НЕ ЗАБЫТЬ ОШИБКИ ВЫВЕСТИ НА ЭКРАН ПРИ СЛИЯНИИ ЭТОЙ ДОМАШКИ
        guard passwordFirst == passwordSecond else {
            print("Пароли должны совпадать")
            return
        }

        guard login.count >= 3, login.count <= 16 else {
            print("Длина логина должна быть от 3 до 16 символов")
            return
        }

        guard passwordFirst.count >= 8 else {
            print("Длина пароля должна быть не менее 8 символов")
            return
        }

        dataProvider.registration(username: login, password: passwordFirst) { [weak self] result in
            switch result {
            case .success(let success):
                self?.onRegistrationSuccess?()
            case .failure(let failure):
                print(failure.rawValue)
            }
        }
    }

    func cancelButtonDidTap() {
        self.dismiss(animated: true)
    }
}
