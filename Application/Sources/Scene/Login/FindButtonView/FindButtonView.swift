import SwiftUI

import SemicolonDesign

struct FindButtonView: View {
    var findId: () -> Void
    var findPassword: () -> Void
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                NavigationLink(
                    destination: FindIdView()
                ) {
                    Text("아이디 찾기 /")
                        .sdText(type: .body4, textColor: Color.GrayScale.gray700)
                }
                NavigationLink(
                    destination: FindPasswordView()
                ) {
                    Text(" 비밀번호 찾기")
                        .sdText(type: .body4, textColor: Color.GrayScale.gray700)
                }
            }
        }
    }
}

struct FindButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FindButtonView(
            findId: { print("아이디 찾기") },
            findPassword: { print("비밀번호 찾기") }
        )
    }
}
