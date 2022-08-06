import SwiftUI
import SemicolonDesign

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 30)
                TextFieldView(
                    id: $viewModel.id,
                    password: $viewModel.password)
                FillButton(
                    text: "로그인",
                    action: {
                        print("로그인")
                    }, type: .rounded
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
