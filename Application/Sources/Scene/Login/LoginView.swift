import SwiftUI
import SemicolonDesign

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 16)
                SDTextField(
                    placeholder: "아이디",
                    text: $viewModel.id
                ).padding(.horizontal, 16)
                SDTextField(
                    placeholder: "비밀번호",
                    text: $viewModel.password
                )
                .padding(.horizontal, 16)
                FillButton(
                    text: "로그인",
                    action: {
                        print("로그인")
                    },
                    type: .rounded
                )
                FindButtonView {
                    print("아이디 찾기")
                } findPassword: {
                    print("비밀번호 찾기")
                }
                Spacer()
            }
            .navigationTitle("로그인")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LoginViewModel()
        LoginView(viewModel: viewModel)
    }
}
