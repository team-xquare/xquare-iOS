import Foundation

struct FCMTokenResponse: Decodable {
    let tokens: [String]
}

extension FCMTokenResponse {
    func toDomain() -> FCMTokensEntity {
        return .init(tokens: tokens)
    }
}
