import Foundation

public struct GithubRankEntity: Hashable {
    public let userID, name, username, profileFileName: String
    public let contributions, ranking: Int
}
