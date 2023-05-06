//
//  ClearCell.swift
//  iosSchool
//
//  Created by Student 1 on 03.05.2023.
//

import UIKit

class ClearCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(named: "Lilac50")?.withAlphaComponent(1)
    }
}
