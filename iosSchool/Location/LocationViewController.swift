//
//  LocationViewController.swift
//  iosSchool
//
//  Created by Student 1 on 02.04.2023.
//

import UIKit

class LocationViewController<View: LocationView>: BaseViewController<View> {

    var selectLocation: ((LocationCellData) -> Void)?

    private let dataProvider: LocationDataProvider

    init(dataProvider: LocationDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBar()

        rootView.makeView()
        rootView.selectLocation = selectLocation

        dataProviderAllLocations()
    }

    // MARK: - Actions

    @objc
    private func reload() {
        DispatchQueue.main.async { [weak self] in
            self?.dataProviderAllLocations()
        }
    }

    // MARK: - Private
    private func setupBar() {
            title = "Выбор планеты"
            navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor(named: "DarkBlue") ?? .black,
                .font: UIFont.systemFont(ofSize: 18)
            ]
            /* navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .refresh,
                target: self,
                action: #selector(reload)
            )*/
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                image: UIImage(named: "refresh"),
                style: .done,
                target: self,
                action: #selector(reload)
            )
        }

    private func dataProviderAllLocations() {
        self.dataProvider.allLocations() { [weak self] result in
            switch result {
            case .success(let success):
                self?.rootView.update(data: LocationViewData(location: success))
            case .failure(let failure):
                print(failure.rawValue)
            }
        }
    }
}
