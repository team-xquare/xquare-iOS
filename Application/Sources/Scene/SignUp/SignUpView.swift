import SwiftUI

import SemicolonDesign

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 20) {
                        Spacer()
                            .frame(height: 16)
                        SDTextField(
                            title: "인증코드",
                            placeholder: "6자리를 입력해주세요",
                            text: $viewModel.authCode
                        )
                        .padding(.horizontal, 16)
                        .onChange(of: viewModel.authCode) { _ in
                            viewModel.checkSignup()
                        }
                        SDTextField(
                            title: "아이디",
                            placeholder: "영문, 숫자 6~20자",
                            text: $viewModel.id,
                            errorMessage: $viewModel.idErrorMessage
                        )
                        .padding(.horizontal, 16)
                        .onChange(of: viewModel.id) { _ in
                            viewModel.checkSignup()
                        }
                        SDTextField(
                            title: "비밀번호",
                            placeholder: "숫자, 영문, 특수문자 조합 최소 6자",
                            text: $viewModel.password
                        )
                        .padding(.horizontal, 16)
                        .onChange(of: viewModel.password) { _ in
                            viewModel.equalPasswordError()
                            viewModel.checkSignup()
                        }
                        SDTextField(
                            title: "비밀번호 재입력",
                            placeholder: "재입력",
                            text: $viewModel.reEnterPassword,
                            errorMessage: $viewModel.passwordErrorMessage
                        )
                        .padding(.horizontal, 16)
                        .onChange(of: viewModel.reEnterPassword) { _ in
                            viewModel.equalPasswordError()
                            viewModel.checkSignup()
                        }
                        Spacer()
                    }
                }
                VStack {
                    Spacer()
                    FillButton(
                        isDisabled: $viewModel.isDisabled,
                        text: "입력 완료",
                        action: {
                            viewModel.signUp()
                        },
                        type: .rounded
                    )
                    .fullScreenCover(isPresented: $viewModel.isSuccess) {
                        AppDependency.resolve().loginView
                    }
                }
            }.navigationTitle("회원가입")
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        AppDependency.resolve().signupView
    }
}
