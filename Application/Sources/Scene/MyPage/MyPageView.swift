import SwiftUI

import SemicolonDesign

struct MyPageView: View {

    @StateObject var viewModel: MyPageViewModel
    @EnvironmentObject var xquareRouter: XquareRouter

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            Spacer().frame(height: 20)
            MyInformationView(
                imageUrl: viewModel.profileImagrUrl,
                name: viewModel.name,
                gradeClassNum: viewModel.gradeClassNum,
                id: viewModel.id,
                birthDay: viewModel.birthDay,
                uiImage: $viewModel.profileImage,
                xPhotosIsPresented: $viewModel.xPhotosIsPresented
            )
            Spacer().frame(height: 24)
            Rectangle()
                .foregroundColor(.GrayScale.gray50)
                .frame(height: 12)
            Spacer().frame(height: 16)
            AccountLinkingView(isGithubLinking: viewModel.isGithubLinking)
            Spacer().frame(height: 20)
            AccountManagementView(
                services: [("로그아웃", { viewModel.showLogoutAlert = true })]
            )
            Spacer()
        }
        .sdAlert(isPresented: $viewModel.showLogoutAlert) {
            SDAlert(
                title: "정말 로그아웃 하시겠습니까?",
                button1: (text: "아니요", action: { }),
                button2: (text: "네", action: {
                    viewModel.withdrawal()
                    self.xquareRouter.popToRoot()
                })
            )
        }
        .sdOkayAlert(isPresented: $viewModel.isOverStorage, sdAlert: {
            SDOkayAlert(title: "업로드 실패", message: "파일의 용량은 10GB이하여야 합니다.")
        })
        .sdOkayAlert(isPresented: $viewModel.showLinkingErrorAlert) {
            SDOkayAlert(title: "오류", message: "연동에 실패하였습니다.")
        }
        .sdPhotoPicker(
            isPresented: $viewModel.xPhotosIsPresented,
            selection: $viewModel.selectProfileImage
        )
        .onChange(of: viewModel.selectProfileImage, perform: { _ in
            viewModel.uploadImage()
        })
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("마이페이지")
        .onAppear {
            viewModel.fetchProfile()
            viewModel.checkGithubConnecting()
        }
        .onOpenURL(perform: viewModel.registerGithubID(callbackURL:))
    }
}
