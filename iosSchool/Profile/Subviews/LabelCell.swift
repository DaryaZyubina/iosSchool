//
//  DateRegistrationCell.swift
//  iosSchool
//
//  Created by Student 1 on 21.04.2023.
//

import UIKit

class LabelCell: UITableViewCell {

    var viewModel: ProfileCellData? {
        didSet {
            update(viewModel)
        }
    }

    @IBOutlet private weak var maintextLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var labelView: UIView!
    @IBOutlet private weak var colorView: UIColorWell!

    private func update(_ viewModel: ProfileCellData?) {
        guard let viewModel else {
            return
        }

        labelView.layer.borderWidth = 1
        labelView.layer.borderColor = UIColor(named: "LabelDarkGrey")?.withAlphaComponent(1).cgColor
        labelView.layer.cornerRadius = 15

        if viewModel.isCellContainsData {
            // maintextLabel.text = "Дата регистрации" -- по фигме, но суть другая
            maintextLabel.text = "Время входа"
            dateLabel.isHidden = false
            colorView.isHidden = true
        } else {
            maintextLabel.text = "Цвет профиля"
            dateLabel.isHidden = true
            colorView.isHidden = false
            colorView.selectedColor = .blue
        }
    }
}
