import Foundation

public struct GithubRankEntity {
    public let userID, name, username, profileFileName: String
    public let contributions, ranking: Int

    public init(
        userID: String,
        name: String,
        username: String,
        profileFileName: String,
        contributions: Int,
        ranking: Int
    ) {
        self.userID = userID
        self.name = name
        self.username = username
        self.profileFileName = profileFileName
        self.contributions = contributions
        self.ranking = ranking
    }
}
