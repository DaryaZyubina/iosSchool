//
//  CharacterView.swift
//  iosSchool
//
//  Created by Student 1 on 21.04.2023.
//

import UIKit

protocol CharacterView: UIView {
    func makeView()
    func update(data: CharacterViewData)
    func updateCharacter(url: String, with data: CharacterCellData)
}

class CharacterViewImp: UIView, CharacterView {
    var screenSize:  CGRect = UIScreen.main.bounds
    var screenWidth: CGFloat!
    var widthInset: CGFloat!
    let itemSpacing: CGFloat = 16

    private var data: [CharacterCellData] = []

    private lazy var collectionView: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout: layout())
    }()

    func makeView() {

        screenWidth = screenSize.width

        collectionView.backgroundColor = .clear
        collectionView.dataSource = self

        let nib = UINib(nibName: CharacterCell.className, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CharacterCell.className)
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

    func update(data: CharacterViewData) {
        self.data = data.cells
        collectionView.reloadData()
    }

    func updateCharacter(url: String, with data: CharacterCellData) {
        guard let index = self.data.firstIndex(where: { $0.url == url }) else {
            return
        }
        self.data[index] = data
        // collectionView.reloadData()
        guard let cell = collectionView.cellForItem(at: .init(row: index, section: 0)) as? CharacterCell else {
            return
        }
        cell.viewModel = data
    }

    // MARK: - Private methods

    private func layout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout(sectionProvider: provider())
    }

    private func provider() -> UICollectionViewCompositionalLayoutSectionProvider {
        { _, _ in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .estimated(167),
                heightDimension: .estimated(167)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(167)
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                repeatingSubitem: item,
                count: 2
            )

            group.interItemSpacing = .fixed(self.itemSpacing)

            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 30
            self.widthInset = (self.screenWidth - 167 * 2 - self.itemSpacing) / 2
            if self.widthInset < 20 {
                section.contentInsets = NSDirectionalEdgeInsets(
                    top: 59,
                    leading: self.widthInset,
                    bottom: 77,
                    trailing: self.widthInset
                )
            } else {
                section.contentInsets = NSDirectionalEdgeInsets(top: 59, leading: 20, bottom: 77, trailing: 20)
            }

            return section
        }
    }
}

// MARK: - UICollectionViewDataSource

extension CharacterViewImp: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        data.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCell.className,
            for: indexPath
        ) as? CharacterCell else {
            return UICollectionViewCell()
        }

        cell.backgroundColor = .white.withAlphaComponent(0.5)
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 15

        guard data.count > indexPath.row else {
            return cell
        }
        cell.viewModel = data[indexPath.row]
        return cell
    }
}
