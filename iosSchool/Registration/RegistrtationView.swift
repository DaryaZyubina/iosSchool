//
//  RegView.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import UIKit

protocol RegistrationView: UIView {
    func update(with data: RegistrationViewData)
}

class RegistrationViewImp: UIView, RegistrationView {

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var registrationLabel: UILabel!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordFirstTextField: UITextField!
    @IBOutlet private weak var passwordSecondTextField: UITextField!
    @IBOutlet private weak var doneButton: CustomButton!
    @IBOutlet private weak var cancelButton: CustomButton!

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func update(with data: RegistrationViewData) {
        registrationLabel.text = data.registrationTextFieldPlaceHolder

        loginTextField.backgroundColor = .white.withAlphaComponent(0.6)
        loginTextField.layer.cornerRadius = 15
        loginTextField.layer.masksToBounds = true

        passwordFirstTextField.backgroundColor = .white.withAlphaComponent(0.6)
        passwordFirstTextField.layer.cornerRadius = 15
        passwordFirstTextField.layer.masksToBounds = true

        passwordSecondTextField.backgroundColor = .white.withAlphaComponent(0.6)
        passwordSecondTextField.layer.cornerRadius = 15
        passwordSecondTextField.layer.masksToBounds = true

        makeButton(button: doneButton)
        makeButton(button: cancelButton)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    // MARK: - Actions

    @IBAction func doneButtonDidTap(sender: UIButton) {
        endEditing(true)
    }

    @objc
    private func closeKeyboard() {
        endEditing(true)
    }

    @objc
    private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        scrollView.contentInset.bottom = keyboardHeight + 15
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }

    @objc
    private func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = .zero
    }

    @IBAction func cancelButtonDidTap(sender: UIButton) {
        endEditing(true)
        // осуществить переход обратно на авторизацию?
    }

    // MARK: - Private methods

    private func makeButton(button: CustomButton) {
        button.normalColor = UIColor(named: "VelvetBlue") ?? .white
        button.highlightColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor(named: "DarkBlue")?.withAlphaComponent(0.22).cgColor
        button.layer.borderWidth = 1
        button.layer.shadowOpacity = 0.25
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 4
    }
}

// MARK: - UITextFieldDelegate

extension RegistrationViewImp: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            textField.resignFirstResponder()
            passwordFirstTextField.becomeFirstResponder()
        } else if textField == passwordFirstTextField {
            textField.resignFirstResponder()
            passwordSecondTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
