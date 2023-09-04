import SwiftUI
import SemicolonDesign

// 안씀

struct GithubCommitRankingView: View {

    var viewMode: GithubRankingViewModel
    @State var isClickThisWeek: Bool = true
    @State var isClickThisMonth: Bool = false
    @State var isClickThisYear: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack( alignment: .center, spacing: 8) {
                SelectButtonView(selection: $isClickThisWeek, text: "이번 주") {
                    self.isClickThisMonth = false
                    self.isClickThisYear = false
                }
                SelectButtonView(selection: $isClickThisMonth, text: "이번 달") {
                    self.isClickThisWeek = false
                    self.isClickThisYear = false
                }
                SelectButtonView(selection: $isClickThisYear, text: "올해") {
                    self.isClickThisMonth = false
                    self.isClickThisWeek = false
                }
                Spacer()
            }
            .padding(16)
            CommitListView(
                commitDatas: viewMode.githubRankList
            )
            Spacer()
            CommitListCellView(myGithubData: viewMode.myGithubRank, isMyRank: true)
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        }
        .navigationTitle("Github 커밋 랭킹")
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
    }
}
