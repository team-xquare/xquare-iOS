import Foundation

struct ClassUserListResponse: Decodable {
    let response: [ClassUserResponse]
}

extension ClassUserListResponse {
    func toDomain() -> [ClassUserEntity] {
        return response.map { $0.toDomain() }
    }
}
