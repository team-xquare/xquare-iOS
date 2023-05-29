import Foundation

protocol LocalTokenDataSource {
    func registerAccessToken(_ accessToken: String)
    func fetchAccessToken() -> String?
    func registerRefreshToken(_ refreshToken: String)
    func fetchRefreshToken() -> String?
    func registerExpiredAt(_ expiredAt: String)
    func fetchExpiredDate() -> Date?
    func resetToken()
}
