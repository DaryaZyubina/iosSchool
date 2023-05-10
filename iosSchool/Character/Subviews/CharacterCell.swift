//
//  CharacterCell.swift
//  iosSchool
//
//  Created by Student 1 on 21.04.2023.
//

import UIKit

class CharacterCell: UICollectionViewCell {

    var viewModel: CharacterCellData? {
        didSet {
            update(viewModel: viewModel)
        }
    }

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!

    private func update(viewModel: CharacterCellData?) {
        guard let viewModel else {
            return
        }

        self.backgroundColor = .white.withAlphaComponent(0.5)
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true

        imageView.image = viewModel.isLoading ? UIImage(named: "placeholderCharacter") : viewModel.image
        nameLabel.text = viewModel.name
        typeLabel.text = viewModel.type
    }
}
