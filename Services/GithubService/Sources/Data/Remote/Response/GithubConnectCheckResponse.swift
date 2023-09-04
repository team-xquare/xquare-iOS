import Foundation

struct GithubConnectCheckResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case isConnected = "is_connected"
    }

    let isConnected: Bool
}

extension GithubConnectCheckResponse {
    func toDomain() -> GithubConnectCheckEntity {
        return .init(isConnected: isConnected)
    }
}
