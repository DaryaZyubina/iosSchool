//
//  RegView.swift
//  iosSchool
//
//  Created by Student 1 on 26.03.2023.
//

import UIKit

protocol RegistrationView: UIView {
    var delegate: RegistrationViewDelegate? { get set }

    func update(with data: RegistrationViewData)
}

protocol RegistrationViewDelegate: AnyObject {
    func doneButtonDidTap(login: String, passwordFirst: String, passwordSecond: String)
    func cancelButtonDidTap()
}

class RegistrationViewImp: UIView, RegistrationView {

    weak var delegate: RegistrationViewDelegate?

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
        let recogniser = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        addGestureRecognizer(recogniser)

        registrationLabel.text = data.registrationTextFieldPlaceHolder

        loginTextField.backgroundColor = .white.withAlphaComponent(0.6)
        loginTextField.layer.cornerRadius = 15
        loginTextField.layer.masksToBounds = true
        loginTextField.delegate = self

        passwordFirstTextField.backgroundColor = .white.withAlphaComponent(0.6)
        passwordFirstTextField.layer.cornerRadius = 15
        passwordFirstTextField.layer.masksToBounds = true
        passwordFirstTextField.delegate = self

        passwordSecondTextField.backgroundColor = .white.withAlphaComponent(0.6)
        passwordSecondTextField.layer.cornerRadius = 15
        passwordSecondTextField.layer.masksToBounds = true
        passwordSecondTextField.delegate = self

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

        delegate?.doneButtonDidTap(
            login: loginTextField.text ?? "",
            passwordFirst: passwordFirstTextField.text ?? "",
            passwordSecond: passwordSecondTextField.text ?? ""
        )

    }

    @IBAction func cancelButtonDidTap(sender: UIButton) {
        endEditing(true)

        delegate?.cancelButtonDidTap()
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
            passwordFirstTextField.becomeFirstResponder()
        } else if textField == passwordFirstTextField {
            passwordSecondTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
