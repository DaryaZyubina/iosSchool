//
//  CharacterViewController.swift
//  iosSchool
//
//  Created by Student 1 on 02.04.2023.
//

import UIKit

class CharacterViewController: UIViewController {

    private let dataProvider: CharacterDataProvider

    init(dataProvider: CharacterDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // allCharacters()
        // singleCharacter(id: 2)
         getCharacterFromLocation(url: "https://rickandmortyapi.com/api/character/1")

    }

    func allCharacters() {
        dataProvider.allCharacters() { [weak self] result in
            switch result {
            case .success(let success):
                print(result)
            case .failure(let failure):
                print(failure.rawValue)
            }
        }
    }

    func singleCharacter(id: Int) {
        dataProvider.singleCharacter(id: id) { [weak self] result in
            switch result {
            case .success(let success):
                print(result)
            case .failure(let failure):
                print(failure.rawValue)
            }
        }
    }

    func getCharacterFromLocation(url: String) {
        dataProvider.getCharacterFromLocation(url: url) { [weak self] result in
            switch result {
            case .success(let success):
                print(result)
            case .failure(let failure):
                print(failure.rawValue)
            }
        }
    }
}
