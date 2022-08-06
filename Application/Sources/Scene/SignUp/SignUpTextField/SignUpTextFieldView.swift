import SwiftUI

import SemicolonDesign

struct SignUpTextFieldView: View {
    var title: String
    var placeholer: String
    @Binding var text: String
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 16)
            SDTextField(
                title: title,
                placeholder: placeholer,
                text: $text
            )
            Spacer()
                .frame(width: 16)
        }
    }
}

struct SignUpTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTextFieldView(
            title: "인증번호",
            placeholer: "6자리를 입력해주세요",
            text: .constant(""))
    }
}
