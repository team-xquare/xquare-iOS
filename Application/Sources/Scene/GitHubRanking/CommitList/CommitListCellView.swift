import SwiftUI
import SemicolonDesign
import GithubService

// 안씀

struct CommitListCellView: View {
    var myGithubData: GithubRankEntity?
    var isMyRank: Bool = false

    var body: some View {
        HStack(alignment: .center) {
            Text("\(myGithubData?.ranking ?? 0)")
                .sdText(type: .body1, textColor: .GrayScale.gray900)
            Spacer().frame(width: 21)
            AsyncImage(url: URL(string: myGithubData?.profileFileName ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image("DefaultImage")
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: 44, height: 44)
            .cornerRadius(22)
            VStack(alignment: .leading, spacing: 0) {
                Text(myGithubData?.name ?? "")
                    .sdText(type: .body4, textColor: .GrayScale.gray800)
                Text("@\(myGithubData?.userID ?? "")")
                    .sdText(type: .caption2, textColor: .GrayScale.gray700)
            }
            Spacer()
            Text("\(myGithubData?.contributions ?? 0)")
                .sdText(type: .body1, textColor: .GrayScale.gray900)
        }
        .padding(EdgeInsets(top: 13, leading: 21, bottom: 13, trailing: 20))
        .background(isMyRank ? Color.Primary.purple50 : Color.GrayScale.gray50)
        .cornerRadius(12)
    }
}
