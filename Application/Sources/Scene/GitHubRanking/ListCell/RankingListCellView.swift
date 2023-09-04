import SwiftUI
import SemicolonDesign

import GithubService

struct RankingListCellView: View {
    var myGithubData: GithubRankEntity?
    var isMyRank: Bool = false

    var body: some View {
        HStack(alignment: .center) {
            if let data = myGithubData {
                AsyncImage(url: URL(string: myGithubData?.profileFileName ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Image("DefaultImage")
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 42, height: 42)
                .cornerRadius(21)
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(myGithubData?.ranking ?? 0)위 : \(myGithubData?.name ?? "")")
                        .sdText(type: .caption2, textColor: .GrayScale.gray900)
                    Text("@\(myGithubData?.username ?? "")")
                        .sdText(type: .caption3, textColor: .GrayScale.gray700)
                }
                Spacer()
                Text("\(myGithubData?.contributions ?? 0) 커밋")
                    .sdText(type: .body1, textColor: .GrayScale.gray900)
            } else {
                HStack {
                    Text("깃허브 연동이 필요합니다.")
                        .sdText(type: .body3, textColor: .GrayScale.gray900)
                    Spacer()
                }
                .padding(.vertical, 10)
            }
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 15))
        .background(Color.GrayScale.gray50)
        .cornerRadius(12)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 1)
                .foregroundColor(isMyRank ? .Primary.purple100 : .clear)
        }
    }
}
