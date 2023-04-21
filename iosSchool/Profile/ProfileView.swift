//
//  ProfileView.swift
//  iosSchool
//
//  Created by Student 1 on 20.04.2023.
//

import UIKit

protocol ProfileView: UIView {
    func makeView()
}

class ProfileViewImp: UIView, ProfileView {

    private let imageViewHeader = UIImageView()
    private let imageViewProfile = UIImageView()
    private let tableView = UITableView()
    private let exitButtonView = CustomButton()

    func makeView() {
        imageViewHeader.image = UIImage(named: "header")
        imageViewHeader.contentMode = .top
        imageViewHeader.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageViewHeader)
        imageViewHeader.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageViewHeader.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageViewHeader.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageViewHeader.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageViewHeader.heightAnchor.constraint(equalToConstant: 300).isActive = true

        imageViewProfile.image = UIImage(named: "profileWhite")
        imageViewProfile.contentMode = .scaleToFill
        imageViewProfile.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageViewProfile)
        imageViewProfile.topAnchor.constraint(equalTo: topAnchor, constant: 246).isActive = true
        imageViewProfile.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 140).isActive = true
        imageViewProfile.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -140).isActive = true
        imageViewProfile.heightAnchor.constraint(equalToConstant: 110).isActive = true
        imageViewProfile.widthAnchor.constraint(equalToConstant: 110).isActive = true

        self.backgroundColor = UIColor(named: "Lilac50")?.withAlphaComponent(1)

        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        var nib = UINib(nibName: LoginLabelCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: LoginLabelCell.className)
        nib = UINib(nibName: DateRegistrationCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DateRegistrationCell.className)
        nib = UINib(nibName: ColorProfileCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ColorProfileCell.className)
        addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: imageViewProfile.bottomAnchor, constant: 26).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        exitButtonView.setTitle("Выйти", for: .normal)
        makeButton(button: exitButtonView)
        exitButtonView.backgroundColor = UIColor(named: "VelvetBlue")
        addSubview(exitButtonView)
        exitButtonView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = exitButtonView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10)
        topConstraint.priority = UILayoutPriority(rawValue: 250)
        topConstraint.isActive = true
        exitButtonView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        exitButtonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -46).isActive = true
        exitButtonView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        exitButtonView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

extension ProfileViewImp: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: LoginLabelCell.className) as? LoginLabelCell {
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: DateRegistrationCell.className
            ) as? DateRegistrationCell {
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: ColorProfileCell.className
            ) as? ColorProfileCell {
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
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
