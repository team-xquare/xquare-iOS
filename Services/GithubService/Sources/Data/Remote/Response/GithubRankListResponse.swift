import Foundation

struct GithubRankListResponse: Decodable {
    let users: [GithubRankResponse]
}

extension GithubRankListResponse {
    func toDomain() -> GithubRankListEntity {
        return .init(
            users: users.map { $0.toDomain() }
        )
    }
}
