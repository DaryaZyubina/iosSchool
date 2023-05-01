//
//  StorageManager.swift
//  iosSchool
//
//  Created by Student 1 on 24.04.2023.
//

import Foundation
import KeychainAccess

protocol StorageManager {
    func cleanKeychainIfNeeded()
    func safeToken(token: TokenResponse?)
    func getToken() -> TokenResponse?
    func removeToken()
    func setDateToProfile()
    func setUsernameToProfileFromNano(profile: Profile)
    func setUsernameToProfileByUser(userName: String)
    func getUsername()
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
        UserDefaults.standard.set(
            Date(),
            forKey: "ProfileTime:\(StorageManagerKey.userId.rawValue)"
        )
    }

    func setUsernameToProfileFromNano(profile: Profile) {
        UserDefaults.standard.set(
            profile.username,
            forKey: "ProfileUsername:\(StorageManagerKey.userId.rawValue)"
        )
    }

    func setUsernameToProfileByUser(userName: String) {
        UserDefaults.standard.set(
            userName,
            forKey: "ProfileUsername:\(StorageManagerKey.userId.rawValue)"
        )
    }

    func getUsername() {
        UserDefaults.standard.string(forKey: "ProfileUsername:\(StorageManagerKey.userId.rawValue)")
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
