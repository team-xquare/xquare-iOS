import SwiftUI
import SemicolonDesign
import GithubService

struct TopRankView: View {
    var topRankData: [GithubRankEntity]

    var body: some View {
        HStack(alignment: .bottom, spacing: 17) {
            if topRankData.count >= 3 {
                SecondRankView(
                    name: topRankData[1].name,
                    profileImageURL: topRankData[1].profileFileName,
                    userID: topRankData[1].username,
                    countOfCommit: topRankData[1].contributions
                )
                FirstRankView(
                    name: topRankData[0].name,
                    profileImageURL: topRankData[0].profileFileName,
                    userID: topRankData[0].username,
                    countOfCommit: topRankData[0].contributions
                )
                ThirdRankView(
                    name: topRankData[2].name,
                    profileImageURL: topRankData[2].profileFileName,
                    userID: topRankData[2].username,
                    countOfCommit: topRankData[2].contributions
                )
            }
        }
    }
}
