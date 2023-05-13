//
//  StorageManager.swift
//  iosSchool
//
//  Created by Student 1 on 24.04.2023.
//

import Foundation
import KeychainAccess
import UIKit

protocol StorageManager {
    func cleanKeychainIfNeeded()
    func safeToken(token: TokenResponse?)
    func getToken() -> TokenResponse?
    func removeToken()
    func setDateToProfile()
    func getProfilesDate() -> String?
    func setUsernameToProfileByUsername(username: String)
    func getUsername() -> String?
    func setFavouriteColor(color: UIColor)
    func getFavouriteColor() -> UIColor?
}

class StorageManagerImp: StorageManager {

    private let keychain = Keychain(service: Constants.serviceId)

    func cleanKeychainIfNeeded() {
        guard !notFirstLaunch() else {
            return
        }
        saveFirstLaunch()
        do {
            try keychain.removeAll()
        } catch {
            print(error as Any)
        }
    }

    func safeToken(token: TokenResponse?) {
        guard let token else {
            return
        }
        do {    // save info to StorageManagerKey
            try keychain.set(token.token, key: StorageManagerKey.token.rawValue)
            try keychain.set(token.userId, key: StorageManagerKey.userId.rawValue)
        } catch {
            print(error as Any)
        }
    }

    func getToken() -> TokenResponse? {
        do {
            guard let token = try keychain.get(StorageManagerKey.token.rawValue),
                let userId = try keychain.get(StorageManagerKey.userId.rawValue) else {
                return nil
            }
            return TokenResponse(token: token, userId: userId)
        } catch {
            print(error as Any)
        }
        return nil
    }

    func removeToken() {    // for button in profile ("exit")
        do {
            try keychain.remove(StorageManagerKey.token.rawValue)
            try keychain.remove(StorageManagerKey.userId.rawValue)
            UserDefaults.standard.removeObject(forKey: StorageManagerKey.userId.rawValue)
        } catch {
            print(error as Any)
        }
    }

    func setDateToProfile() {
        let format = DateFormatter()
        format.dateFormat = "dd.MM.yy"
        UserDefaults.standard.set(
            format.string(from: Date()),
            forKey: "ProfileTime:\(StorageManagerKey.userId.rawValue)"
        )
    }

    func getProfilesDate() -> String? {
        UserDefaults.standard.string(forKey: "ProfileTime:\(StorageManagerKey.userId.rawValue)")
    }

    func setUsernameToProfileByUsername(username: String) {
        UserDefaults.standard.set(
            username,
            forKey: "ProfileUsername:\(StorageManagerKey.userId.rawValue)"
        )
    }

    func getUsername() -> String? {
        UserDefaults.standard.string(forKey: "ProfileUsername:\(StorageManagerKey.userId.rawValue)")
    }

    func setFavouriteColor(color: UIColor) {
        do {
            let encodedData =  try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
            let userDefaults = UserDefaults.standard
            userDefaults.set(
                encodedData,
                forKey: "FavouriteColor:\(StorageManagerKey.userId.rawValue)"
            )
        } catch {
            print(error as Any)
        }
    }

    func getFavouriteColor() -> UIColor? {
        do {
            if let decoded  = UserDefaults.standard.object(
                forKey: "FavouriteColor:\(StorageManagerKey.userId.rawValue)"
            ) as? Data {
                return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as? UIColor
            } else {
                return UIColor(named: "Lilac50")
            }
        } catch {
            print(error as Any)
        }

        return nil
    }
}

private extension StorageManagerImp {

    enum StorageManagerKey: String {
        case notFirstLaunch
        case token
        case userId
    }

    struct Constants {
        static let serviceId = "StorageManagerKeychain.Service.Id"
    }

    func notFirstLaunch() -> Bool {
        UserDefaults.standard.bool(forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }

    func saveFirstLaunch() {
        UserDefaults.standard.set(true, forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }
}
