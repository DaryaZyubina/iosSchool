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

    weak var delegate: LabelCellDelegate?

    @IBOutlet private weak var maintextLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var colorLabel: UILabel!

    private func update(_ viewModel: ProfileCellData?) {
        guard let viewModel else {
            return
        }

        guard let cell = delegate?.getIndexOfRow(cell: self) else {
                return
        }
        print(cell)

        dateLabel.text = viewModel.lastTimeVisited
        colorLabel.text = "Color!"

        switch cell {
        case 3:
            print("Im here")
            maintextLabel.text = "Дата регистрации"
            dateLabel.isHidden = false
            colorLabel.isHidden = true
        case 4:
            maintextLabel.text = "Цвет профиля"
            dateLabel.isHidden = true
            colorLabel.isHidden = false
        default:
            print("Everything is bad")
        }
    }
}
