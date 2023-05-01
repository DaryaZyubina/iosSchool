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

protocol RegistrationViewDelegate: AnyObject {
    func doneButtonDidTap(login: String, passwordFirst: String, passwordSecond: String)
}

class RegistrationViewImp: UIView, RegistrationView {
    
    @IBOutlet private weak var registrationLabel: UILabel!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordFirstTextField: UITextField!
    @IBOutlet private weak var passwordSecondTextField: UITextField!
    @IBOutlet private weak var doneButton: CustomButton!
    @IBOutlet private weak var cancelButton: CustomButton!
    
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
