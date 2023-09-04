import SwiftUI
import SemicolonDesign

struct AccountLinkingView: View {
    var isGithubLinking: Bool
    var body: some View {
        VStack(alignment: .leading) {
            OptionTitleView(title: "계정 연동")
            Spacer().frame(height: 12)
            HStack(alignment: .center) {
                Text("Github 연동")
                    .sdText(type: .body2, textColor: .GrayScale.gray900)
                Spacer()
                Button(action: {
                    if !isGithubLinking {
                        UIApplication.shared.open(
                            URL(string: "https://github.com/login/oauth/authorize?client_id=7ba1da5afd9b182e9793")!
                        )
                    }
                }, label: {
                    Text(isGithubLinking ? "연동됨" : "연동하기")
                        .sdText(
                            type: .body3,
                            textColor: isGithubLinking ? .Primary.purple400 : .white
                        )
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        .background(isGithubLinking ? Color.Primary.purple50 : Color.Primary.purple400)
                        .cornerRadius(8)
                })
                .disabled(isGithubLinking)
            }
            .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 10))
            .background(Color.GrayScale.gray50)
            .cornerRadius(12)
            .padding(.horizontal, 16)
        }
    }
}
