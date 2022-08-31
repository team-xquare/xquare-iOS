import Foundation

struct SigninAndRefreshTokenResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expirationAt = "expire_at"
    }

    let accessToken: String
    let refreshToken: String
    let expirationAt: String

}
