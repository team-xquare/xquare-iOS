import SwiftUI

struct AuthInformationView: View {
    @Binding var authCode: String
    @Binding var id: String
    @Binding var password: String
    @Binding var reEnterPassword: String
    var body: some View {
        VStack(spacing: 20) {
            SignUpTextFieldView(
                title: "인증코드",
                placeholer: "6자리를 입력해주세요",
                text: $authCode
            )
            SignUpTextFieldView(
                title: "아이디",
                placeholer: "영문, 숫자 6~20자",
                text: $id
            )
            SignUpTextFieldView(
                title: "비밀번호",
                placeholer: "숫자, 영문, 특수문자 조합 최소 6자",
                text: $password
            )
            SignUpTextFieldView(
                title: "비밀번호 재입력",
                placeholer: "재입력",
                text: $reEnterPassword
            )
        }
    }
}

struct AuthInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthInformationView(
            authCode: .constant(""),
            id: .constant(""),
            password: .constant(""),
            reEnterPassword: .constant("")
        )
    }
}
