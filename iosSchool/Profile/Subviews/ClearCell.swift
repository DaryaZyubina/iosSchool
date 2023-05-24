//
//  ClearCell.swift
//  iosSchool
//
//  Created by Student 1 on 03.05.2023.
//

import UIKit

class ClearCell: UITableViewCell {

    var viewModel: ProfileCellData? {
        didSet {
            update(viewModel)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func update(_ viewModel: ProfileCellData?) {
        guard let viewModel else {
            return
        }
        self.backgroundColor = viewModel.color?.withAlphaComponent(0)
    }

}
