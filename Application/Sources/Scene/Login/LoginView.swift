import SwiftUI
import SemicolonDesign
import AuthService

struct LoginView: View {

    @EnvironmentObject var xquareRouter: XquareRouter
    @StateObject var viewModel: LoginViewModel
    @State var isLoginButtonDisabled: Bool = true
    @State var isShowChangeIdPasswordAlert: Bool = false
    var body: some View {
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
                    action: viewModel.login,
                    type: .rounded
                )
                Button(action: {
                    isShowChangeIdPasswordAlert.toggle()
                }, label: {
                    Text("아이디 찾기 / 비밀번호 찾기")
                        .sdText(type: .body4, textColor: .GrayScale.gray700)
                })
                Spacer()
            }
            .onAppear(perform: viewModel.checkUnlock)
            .navigationTitle("로그인")
            .setNavigationBackButtonWithRouter()
            .sdOkayAlert(isPresented: $isShowChangeIdPasswordAlert, sdAlert: {
                SDOkayAlert(title: "알림", message: "XQUARE 페이스북페이지에 문의해주세요.")
            })
            .sdOkayAlert(isPresented: $viewModel.isInternetNotWorking, sdAlert: {
                SDOkayAlert(title: "문제가 발생했습니다.", message: "네트워크가 원할하지 않습니다.")
            })
            .onChange(of: viewModel.isLoginSuccess, perform: { isSuccess in
                if isSuccess {
                    self.xquareRouter.presentFullScreen(.main)
                }
            })
    }
}
