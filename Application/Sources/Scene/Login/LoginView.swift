import SwiftUI
import SemicolonDesign
import AuthService

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    @State var isDisabled: Bool = true
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
                        isDisabled = viewModel.textFieldIsEmpty()
                    })
                .padding(.horizontal, 16)
                SDTextField(
                    placeholder: "비밀번호",
                    text: $viewModel.password,
                    errorMessage: viewModel.errorMessage
                )
                .onChange(
                    of: viewModel.password,
                    perform: { _ in
                        isDisabled = viewModel.textFieldIsEmpty()
                    })
                .padding(.horizontal, 16)
                FillButton(
                    isDisabled: $isDisabled,
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
        }
        .fullScreenCover(isPresented: $viewModel.isSuccess) {
            mainView
        }
    }
}
