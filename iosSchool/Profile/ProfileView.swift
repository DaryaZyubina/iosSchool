//
//  ProfileView.swift
//  iosSchool
//
//  Created by Student 1 on 20.04.2023.
//

import UIKit

protocol ProfileView: UIView {
    func makeView()
    func update(data: ProfileViewData)
}

class ProfileViewImp: UIView, ProfileView {

    private var profileData: ProfileViewData?
    private let tableView = UITableView()
    private let exitButton = CustomButton()

    func makeView() {

        self.backgroundColor = UIColor(named: "Lilac50")?.withAlphaComponent(1)

        makeTable(table: tableView)
        makeButton(button: exitButton)
    }

    func update(data: ProfileViewData) {
        profileData = data

        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    private func makeTable(table: UITableView) {
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none

        var nib = UINib(nibName: HeaderCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: HeaderCell.className)
        nib = UINib(nibName: LoginLabelCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: LoginLabelCell.className)
        nib = UINib(nibName: ClearCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ClearCell.className)
        nib = UINib(nibName: LabelCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: LabelCell.className)
        addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: superview?.topAnchor ?? topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

    private func makeButton(button: CustomButton) {
        button.normalColor = UIColor(named: "VelvetBlue") ?? .white
        button.highlightColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor(named: "DarkBlue")?.withAlphaComponent(0.22).cgColor
        button.layer.borderWidth = 1
        button.layer.shadowOpacity = 0.25
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 4
        button.setTitle("Выйти", for: .normal)
        button.backgroundColor = UIColor(named: "VelvetBlue")
        addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = button.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10)
        topConstraint.priority = UILayoutPriority(rawValue: 250)
        topConstraint.isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -46).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

extension ProfileViewImp: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: HeaderCell.className
            ) as? HeaderCell, let profileData {
                cell.viewModel = profileData.cell
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: LoginLabelCell.className
            ) as? LoginLabelCell, let profileData {
                cell.viewModel = profileData.cell
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: ClearCell.className
            ) as? ClearCell {
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: LabelCell.className, for: indexPath
            ) as? LabelCell, let profileData {
                cell.isCellContainsDate = true
                cell.viewModel = profileData.cell
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: LabelCell.className, for: indexPath
            ) as? LabelCell, let profileData {
                cell.isCellContainsDate = false
                cell.viewModel = profileData.cell
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}

extension ProfileViewImp: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 2:
            if UIScreen.main.bounds.height < 750 {
                return 5
            } else {
                return 71 // 80 - 9
            }
        default:
            return UITableView.automaticDimension
        }
    }
}
