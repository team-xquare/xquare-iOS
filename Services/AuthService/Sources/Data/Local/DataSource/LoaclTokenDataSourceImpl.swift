import Foundation

import XDateUtil
import KeychainModule

class LoaclTokenDataSourceImpl: LoaclTokenDataSource {

    let keychain = KeychainModule<KeychainTypeForAuth>()

    init() {
        keychain.accessGroup = "5G56CAU886.com.xquare.XQUARE-iOS.keychainGroup"
    }

    func registerAccessToken(_ accessToken: String) {
        self.keychain.set(accessToken, forKey: .accessToken)
    }

    func fetchAccessToken() -> String? {
        self.keychain.get(.accessToken)
    }

    func registerRefreshToken(_ refreshToken: String) {
        self.keychain.set(refreshToken, forKey: .refreshToken)
    }

    func fetchRefreshToken() -> String? {
        self.keychain.get(.refreshToken)
    }

    func registerExpiredAt(_ expiredAt: String) {
        self.keychain.set(expiredAt, forKey: .expiredAt)
    }

    func fetchExpiredDate() -> Date? {
        self.keychain.get(.expiredAt)?.toDate(format: .fullDateWithTime)
    }

    func resetToken() {
        self.keychain.delete(.accessToken)
        self.keychain.delete(.refreshToken)
        self.keychain.delete(.expiredAt)
    }

}
