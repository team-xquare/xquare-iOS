import Foundation

import KeychainModule

enum KeychainTypeForAuth: KeychainKeyType {
    case accessToken
    case refreshToken
    case expiredAt
}

extension KeychainTypeForAuth {
    var keyString: String {
        switch self {
        case .accessToken:
            return "ACCESS-TOKEN"
        case .refreshToken:
            return "REFRESH-TOKEN"
        case .expiredAt:
            return "EXPIRED-AT"
        }
    }
}
