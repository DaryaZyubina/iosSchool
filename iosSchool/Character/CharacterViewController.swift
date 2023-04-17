//
//  CharacterViewController.swift
//  iosSchool
//
//  Created by Student 1 on 02.04.2023.
//

import UIKit

class CharacterViewController: UIViewController {

    private var characters: [Character] = []

    private let dataProvider: CharacterDataProvider
    private let imageService: ImageService
    private let charactersUrlsList: [String]

    private let updateQueue = DispatchQueue(label: "CharcterRequestQueue")

    init(dataProvider: CharacterDataProvider, viewModel: LocationCellData, imageService: ImageService) {
        self.dataProvider = dataProvider
        self.imageService = imageService
        charactersUrlsList = viewModel.residents
        super.init(nibName: nil, bundle: nil)

        title = "Жители локации \(viewModel.name)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // UIColor(Lilac80)

        charactersUrlsList.forEach { url in
            requestCharacter(url: url) { [weak self] character in
                print(character.name)
                self?.imageService.getImage(url: character.url) { [weak self] image in
                    print(image?.size ?? 0)
                    // continue HW9, upload image for character (or take existed one)
                }
            }
        }
    }

    private func requestCharacter(url: String, completion: @escaping (Character) -> Void) {
        if let character = characters.first(where: { $0.url == url }) {
            completion(character)
            return
        }

        DispatchQueue.global().async {
            self.dataProvider.singleCharacter(url: url) { [weak self] result in
                switch result {
                case let .success(character):
                    self?.updateQueue.async {
                        self?.characters.append(character)
                        completion(character)
                    }
                case .failure:
                    print("character load fall")
                }
            }
        }
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

    func singleCharacter(url: String) {
        dataProvider.singleCharacter(url: url) { [weak self] result in
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
