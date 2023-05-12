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
    @IBOutlet private weak var activeIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var loadingView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white.withAlphaComponent(0.5)
        self.layer.cornerRadius = 15
        imageView.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        loadingView.backgroundColor = .lightGray.withAlphaComponent(0.5)
    }

    private func update(viewModel: CharacterCellData?) {
        guard let viewModel else {
            return
        }

        if viewModel.isLoading {
            activeIndicator.startAnimating()
            loadingView.isHidden = false
            imageView.image = UIImage(named: "placeholderCharacter")
            nameLabel.isHidden = true
            typeLabel.isHidden = true
        } else {
            activeIndicator.stopAnimating()
            loadingView.isHidden = true
            imageView.image = viewModel.image

            nameLabel.isHidden = false
            typeLabel.isHidden = false
            nameLabel.text = viewModel.name
            typeLabel.text = viewModel.type
        }
    }
}
