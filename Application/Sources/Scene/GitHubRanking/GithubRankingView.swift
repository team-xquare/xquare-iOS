import SwiftUI
import SemicolonDesign

import GithubService

struct GithubRankingView: View {

    @StateObject var viewModel: GithubRankingViewModel
    @State private var isReady = false

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
            .opacity(isReady ? 1 : 0)
            .onChange(of: viewModel.isLoading) {
                if !$0 {
                    withAnimation(Animation.easeOut.speed(0.6)) {
                        self.isReady = true
                    }
                }
            }
        }
        .navigationTitle("Github 랭킹")
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
        .onAppear {
            viewModel.isLoading = true
            viewModel.updateGithubRanking()
        }
        .refreshable { viewModel.updateGithubRanking() }
    }
}
