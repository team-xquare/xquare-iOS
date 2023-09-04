import SwiftUI

import GithubService

// 안씀

struct CommitListView: View {
    var commitDatas: [GithubRankEntity]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 8) {
                ForEach(0..<commitDatas.count, id: \.self) { index in
                    CommitListCellView(myGithubData: commitDatas[index])
                }
            }
            .padding(.horizontal, 16)
        }
    }
}
