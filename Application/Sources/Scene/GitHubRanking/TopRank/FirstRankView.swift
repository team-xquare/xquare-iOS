import SwiftUI
import SemicolonDesign

struct FirstRankView: View {
    var name: String
    var profileImageURL: String
    var userID: String
    var countOfCommit: Int

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                Image.crown
                    .foregroundColor(Color.firstRank)
                    .frame(width: 32, height: 24)
                AsyncImage(url: URL(string: profileImageURL)) { image in
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
                .padding(.top, 17)
            }
            .padding(.bottom, 27)

            Text(name)
                .sdText(type: .body1, textColor: .GrayScale.gray900)
            Text("@\(userID)")
                .sdText(type: .caption4)
            Text("\(countOfCommit) 커밋")
                .sdText(type: .caption4, textColor: .GrayScale.gray900)
        }
        .frame(width: 98)
        .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
        .background(Color.GrayScale.gray50)
        .cornerRadius(12)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 1)
                .foregroundColor(Color.firstRank)
        }
    }
}
