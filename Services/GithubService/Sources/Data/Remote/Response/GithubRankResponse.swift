import Foundation

struct GithubRankResponse: Decodable {
    let userID, name, username: String
    let profileFileName: String
    let contributions, ranking: Int

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name, username
        case profileFileName = "profile_file_name"
        case contributions, ranking
    }
}

extension GithubRankResponse {
    func toDomain() -> GithubRankEntity {
        return .init(
            userID: userID,
            name: name,
            username: username,
            profileFileName: profileFileName,
            contributions: contributions,
            ranking: ranking
        )
    }
}
