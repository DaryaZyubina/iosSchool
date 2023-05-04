//
//  DateRegistrationCell.swift
//  iosSchool
//
//  Created by Student 1 on 21.04.2023.
//

import UIKit

class LabelCell: UITableViewCell {

    var isCellContainsDate: Bool = false

    var viewModel: ProfileCellData? {
        didSet {
            //var isCellContainsDate: Bool = false
            update(viewModel, isCellContainsDate: isCellContainsDate)
        }
    }

    @IBOutlet private weak var maintextLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var colorLabel: UILabel!
    @IBOutlet private weak var labelView: UIView!

    private func update(_ viewModel: ProfileCellData?, isCellContainsDate: Bool) {
        guard let viewModel else {
            return
        }

        labelView.layer.borderWidth = 1
        labelView.layer.borderColor = UIColor(named: "LabelDarkGrey")?.withAlphaComponent(1).cgColor
        labelView.layer.cornerRadius = 15

        if isCellContainsDate {
            // maintextLabel.text = "Дата регистрации" -- по фигме, но суть другая
            maintextLabel.text = "Время входа"
            dateLabel.isHidden = false
            colorLabel.isHidden = true
        } else {
            maintextLabel.text = "Цвет профиля"
            dateLabel.isHidden = true
            colorLabel.isHidden = false
        }
    }
}
