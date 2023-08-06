import Foundation

public struct GithubRankEntity: Equatable {
    public let userID, name, username, profileFileName: String
    public let contributions, ranking: Int
}
