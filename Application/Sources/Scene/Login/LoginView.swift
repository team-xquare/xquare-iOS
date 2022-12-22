import SwiftUI
import SemicolonDesign
import AuthService

struct LoginView: View {

    @StateObject var viewModel: LoginViewModel
    @State var isLoginButtonDisabled: Bool = true
    var mainView: MainView

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 16)
                SDTextField(
                    placeholder: "아이디",
                    text: $viewModel.id
                )
                .onChange(
                    of: viewModel.id,
                    perform: { _ in
                        isLoginButtonDisabled = viewModel.textFieldIsEmpty()
                    })
                .padding(.horizontal, 16)
                SDTextField(
                    placeholder: "비밀번호",
                    text: $viewModel.password,
                    errorMessage: viewModel.errorMessage,
                    isSecure: true
                )
                .onChange(
                    of: viewModel.password,
                    perform: { _ in
                        isLoginButtonDisabled = viewModel.textFieldIsEmpty()
                    })
                .padding(.horizontal, 16)
                FillButton(
                    isDisabled: $isLoginButtonDisabled,
                    text: "로그인",
                    action: {
                        viewModel.login()
                    },
                    type: .rounded
                )
                FindButtonView()
                Spacer()
            }
            .navigationTitle("로그인")
            .setNavigationBackButton()
        }
        .onAppear(perform: viewModel.checkUnlock)
        .sdErrorAlert(isPresented: $viewModel.isInternetNotWorking, sdAlert: {
            SDErrorAlert(errerMessage: "네트워크가 원할하지 않습니다.")
        })
        .fullScreenCover(isPresented: $viewModel.isLoginSuccess) {
            mainView
        }
    }
}
