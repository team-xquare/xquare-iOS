import SwiftUI

import SemicolonDesign

struct FindButtonView: View {
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                NavigationLink(
                    destination: FindIdView()
                ) {
                    Text("아이디 찾기")
                        .sdText(type: .body4)
                }
                Text("/")
                    .sdText(type: .body4)
                NavigationLink(
                    destination: FindPasswordView()
                ) {
                    Text("비밀번호 찾기")
                        .sdText(type: .body4)
                }
            }
        }
    }
}

struct FindButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FindButtonView()
    }
}
