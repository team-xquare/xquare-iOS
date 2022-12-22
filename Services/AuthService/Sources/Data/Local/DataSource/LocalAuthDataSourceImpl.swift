import Foundation

import KeychainSwift

class LocalAuthDataSourceImpl: LocalAuthDataSource {

    let keychain = KeychainSwift()

    func registerIdAndPassword(id: String, password: String) {
        self.keychain.set(id, forKey: "id")
        self.keychain.set(password, forKey: "password")
    }

    func fetchIdAndPassword() -> IdAndPasswordEntity {
        let id = keychain.get("id") ?? ""
        let password = keychain.get("password") ?? ""

        return .init(id: id, password: password)
    }
}
