//
//  LoginLabelCell.swift
//  iosSchool
//
//  Created by Student 1 on 21.04.2023.
//

import UIKit

class LoginLabelCell: UITableViewCell {

    var viewModel: ProfileCellData? {
        didSet {
            update(viewModel)
        }
    }

    @IBOutlet private weak var loginLabel: UILabel!

    private func update(_ viewModel: ProfileCellData?) {
        print("view \(viewModel)")
        guard let viewModel else {
            return
        }
        print("Name \(viewModel.username)")
        loginLabel.text = viewModel.username
    }
}
