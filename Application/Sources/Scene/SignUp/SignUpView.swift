import SwiftUI

import SemicolonDesign

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                    .frame(height: 16)
                SDTextField(
                    title: "인증코드",
                    placeholder: "6자리를 입력해주세요",
                    text: $viewModel.authCode
                ).padding(.horizontal, 16)
                SDTextField(
                    title: "아이디",
                    placeholder: "영문, 숫자 6~20자",
                    text: $viewModel.id
                ).padding(.horizontal, 16)
                SDTextField(
                    title: "비밀번호",
                    placeholder: "숫자, 영문, 특수문자 조합 최소 6자",
                    text: $viewModel.password
                ).padding(.horizontal, 16)
                SDTextField(
                    title: "비밀번호 재입력",
                    placeholder: "재입력",
                    text: $viewModel.reEnterPassword
                ).padding(.horizontal, 16)
                Spacer()
                FillButton(
                    text: "입력 완료",
                    action: {
                        print("회원가입")
                    },
                    type: .rounded
                )
            }.navigationTitle("회원가입")
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignUpViewModel()
        SignUpView(
        viewModel: viewModel
        )
    }
}
