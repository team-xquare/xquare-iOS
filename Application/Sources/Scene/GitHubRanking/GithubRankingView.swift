import SwiftUI
import SemicolonDesign

import GithubService

struct GithubRankingView: View {

    @StateObject var viewMode: GithubRankingViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                TopRankView(topRankData: viewMode.githubRankList)
                Text("나의 순위")
                    .sdText(type: .body1, textColor: .GrayScale.gray900)
                RankingListCellView(
                    myGithubData: viewMode.myGithubRank,
                    isMyRank: true
                )
                Text("전체 순위")
                    .sdText(type: .body1, textColor: .GrayScale.gray900)
                VStack(spacing: 8) {
                    ForEach(0..<viewMode.githubRankList.count, id: \.self) { index in
                        RankingListCellView(
                            myGithubData: viewMode.githubRankList[index],
                            isMyRank: viewMode.myGithubRank?.userID == viewMode.githubRankList[index].userID
                        )
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Github 랭킹")
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
        .onAppear {
            viewMode.fetchMyGithubInfo()
            viewMode.fetchGithubInfoList()
            viewMode.updateGithubRanking()
        }
        .refreshable {
            viewMode.fetchMyGithubInfo()
            viewMode.fetchGithubInfoList()
            viewMode.updateGithubRanking()
        }
    }
}
