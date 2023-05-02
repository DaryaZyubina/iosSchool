//
//  HeaderCell.swift
//  iosSchool
//
//  Created by Student 1 on 24.04.2023.
//

import UIKit

class HeaderCell: UITableViewCell {

    var viewModel: ProfileCellData? {
        didSet {
            update(viewModel: viewModel)
        }
    }

    @IBOutlet private weak var headerImage: UIImageView!
    @IBOutlet private weak var profileImage: UIImageView!

    private func update(viewModel: ProfileCellData?) {
        guard let viewModel else {
            return
        }
        headerImage.image = viewModel.photoHeader
        profileImage.image = viewModel.photoProfile
    }
}
