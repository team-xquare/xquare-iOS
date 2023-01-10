import SwiftUI

import SemicolonDesign
import AuthService
import ComposableArchitecture

struct SignupView: View {

    let store: Store<SignupState, SignupAction>
    var loginView: LoginView

    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                ZStack {
                    ScrollView {
                        VStack(spacing: 20) {
                            Spacer()
                                .frame(height: 16)
                            SDTextField(
                                title: "인증코드",
                                placeholder: "6자리를 입력해주세요",
                                text: viewStore.binding(
                                    get: \.authCode,
                                    send: SignupAction.authCodeChanged
                                )
                            )
                            .padding(.horizontal, 16)
                            .onChange(of: viewStore.state.authCode) { _ in
                                viewStore.send(.checkButtonDisabled)
                            }
                            SDTextField(
                                title: "아이디",
                                placeholder: "영문, 숫자 6~20자",
                                text: viewStore.binding(
                                    get: \.id,
                                    send: SignupAction.idChanged
                                ),
                                errorMessage: viewStore.state.idErrorMessage
                            )
                            .padding(.horizontal, 16)
                            .onChange(of: viewStore.state.id) { _ in
                                viewStore.send(.checkButtonDisabled)
                            }
                            SDTextField(
                                title: "비밀번호",
                                placeholder: "숫자, 영문, 특수문자 조합 최소 6자",
                                text: viewStore.binding(
                                    get: \.password,
                                    send: SignupAction.passwordChanged
                                ),
                                isSecure: true
                            )
                            .padding(.horizontal, 16)
                            .onChange(of: viewStore.state.password) { _ in
                                viewStore.send(.checkPasswordIsEqual)
                                viewStore.send(.checkButtonDisabled)
                            }
                            SDTextField(
                                title: "비밀번호 재입력",
                                placeholder: "재입력",
                                text: viewStore.binding(
                                    get: \.reEnterPassword,
                                    send: SignupAction.reEnterPasswordChange
                                ),
                                errorMessage: viewStore.state.passwordErrorMessage,
                                isSecure: true
                            )
                            .padding(.horizontal, 16)
                            .onChange(of: viewStore.state.reEnterPassword) { _ in
                                viewStore.send(.checkPasswordIsEqual)
                                viewStore.send(.checkButtonDisabled)
                            }
                            TermsCaptionView()
                            Spacer().frame(height: 64)
                        }
                    }
                    VStack {
                        Spacer()
                        FillButton(
                            isDisabled: viewStore.binding(
                                get: \.isDisable,
                                send: SignupAction.checkButtonDisabled
                            ),
                            text: "입력 완료",
                            action: { viewStore.send(.signup) },
                            type: .rounded
                        )
                        .fullScreenCover(isPresented: viewStore.binding(
                            get: \.isSuccess,
                            send: SignupAction.signup
                        )) {
                            loginView
                        }
                    }
                }
                .sdErrorAlert(isPresented: viewStore.binding(
                    get: \.isInternetNotworking,
                    send: SignupAction.signup
                ), sdAlert: {
                    SDErrorAlert(errerMessage: "네트워크가 원할하지 않습니다.")
                })
                .navigationTitle("회원가입")
                .setNavigationBackButton()
            }
            .accentColor(.GrayScale.gray800)
        }
    }
}
