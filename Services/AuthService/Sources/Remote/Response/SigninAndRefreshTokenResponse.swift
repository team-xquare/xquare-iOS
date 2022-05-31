import Foundation

struct SigninAndRefreshTokenResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expirationTime = "expiration_time"
    }

    let accessToken: String
    let refreshToken: String
    let expirationTime: String

}
