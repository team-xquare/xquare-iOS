import SwiftUI

import SemicolonDesign

struct TextFieldView: View {
    @Binding var id: String
    @Binding var password: String
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Spacer()
                    .frame(width: 16)
                SDTextField(
                    placeholder: "아이디",
                    text: $id
                )
                Spacer()
                    .frame(width: 16)
            }
            HStack {
                Spacer()
                    .frame(width: 16)
                SDTextField(
                    placeholder: "비밀번호",
                    text: $password
                )
                Spacer()
                    .frame(width: 16)
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(
            id: .constant(""),
            password: .constant("")
        )
    }
}
