import SwiftUI

import SemicolonDesign
import AuthService

struct SignupView: View {

    @EnvironmentObject var xquareRouter: XquareRouter
    @StateObject var viewModel: SignupViewModel

    var body: some View {
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
                            errorMessage: viewModel.idErrorMessage
                        )
                        .padding(.horizontal, 16)
                        .onChange(of: viewModel.id) { _ in
                            viewModel.checkSignup()
                        }
                        SDTextField(
                            title: "비밀번호",
                            placeholder: "숫자, 영문, 특수문자 조합 최소 6자",
                            text: $viewModel.password,
                            isSecure: true
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
                            errorMessage: viewModel.passwordErrorMessage,
                            isSecure: true
                        )
                        .padding(.horizontal, 16)
                        .onChange(of: viewModel.reEnterPassword) { _ in
                            viewModel.equalPasswordError()
                            viewModel.checkSignup()
                        }
                        TermsCaptionView()
                        Spacer().frame(height: 64)
                    }
                }
                VStack {
                    Spacer()
                    FillButton(
                        isDisabled: $viewModel.isDisabled,
                        text: "입력 완료",
                        action: viewModel.signup,
                        type: .rounded
                    )
                }
            }
            .onChange(of: viewModel.isSuccess, perform: { isSuccess in
                if isSuccess {
                    self.xquareRouter.dismissLast()
                }
            })
            .sdOkayAlert(isPresented: $viewModel.isInternetNotWorking, sdAlert: {
                SDOkayAlert(title: "문제가 발생했습니다.", message: "네트워크가 원할하지 않습니다.")
            })
            .sdOkayAlert(isPresented: $viewModel.isServerError, sdAlert: {
                SDOkayAlert(title: "문제가 발생했습니다.", message: "서버에 문제가 생겼습니다\n(담당자에게 문의해주세요)")
            })
            .navigationBarTitle("회원가입", displayMode: .large)
            .setNavigationBackButtonWithRouter()
            .accentColor(.GrayScale.gray800)
            .navigationBarBackButtonHidden()
    }
}
