import SwiftUI

import SemicolonDesign

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 30)
                AuthInformationView(
                    authCode: $viewModel.authCode,
                    id: $viewModel.id,
                    password: $viewModel.password,
                    reEnterPassword: $viewModel.reEnterPassword
                )
                Spacer()
                    .frame(height: 128)
                FillButton(
                    text: "입력 완료",
                    action: {
                        print("회원가입")
                    }, type: .rounded
                )
                Spacer()
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
