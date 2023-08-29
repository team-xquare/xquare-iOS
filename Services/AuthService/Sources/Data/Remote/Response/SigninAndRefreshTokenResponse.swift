import Foundation

struct SigninAndRefreshTokenResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case accessTokenExpireAt = "access_token_expire_at"
        case refreshToken = "refresh_token"
        case refreshTokenExpireAt = "refresh_token_expire_at"
    }

    let accessToken: String
    let accessTokenExpireAt: String
    let refreshToken: String
    let refreshTokenExpireAt: String
}
