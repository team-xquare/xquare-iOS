import SwiftUI
import SemicolonDesign

import GithubService

struct GithubRankingView: View {

    @StateObject var viewModel: GithubRankingViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                TopRankView(topRankData: viewModel.githubRankList)
                Text("나의 순위")
                    .sdText(type: .body1, textColor: .GrayScale.gray900)
                RankingListCellView(
                    myGithubData: viewModel.myGithubRank,
                    isMyRank: true
                )
                Text("전체 순위")
                    .sdText(type: .body1, textColor: .GrayScale.gray900)
                VStack(spacing: 8) {
                    ForEach(viewModel.githubRankList, id: \.self) { data in
                        RankingListCellView(
                            myGithubData: data,
                            isMyRank: viewModel.myGithubRank?.userID == data.userID
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
            viewModel.fetchMyGithubInfo()
            viewModel.fetchGithubInfoList()
            viewModel.updateGithubRanking()
        }
        .refreshable {
            viewModel.fetchMyGithubInfo()
            viewModel.fetchGithubInfoList()
            viewModel.updateGithubRanking()
        }
    }
}
