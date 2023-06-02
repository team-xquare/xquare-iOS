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
            ServiceSectionButtonView(
                headerText: "계정 설정",
                services: [
                    (text: "로그아웃", action: { viewModel.showLogoutAlert = true }, textColor: .GrayScale.gray900),
                    (text: "회원탈퇴", action: { viewModel.showQuitAlert = true }, textColor: .System.red600)
                ]
            )
            .padding(.top, 16)
            Spacer()
        }
        .sdAlert(isPresented: $viewModel.showQuitAlert) {
            SDAlert(
                title: "정말 회원탈퇴 하시겠습니까?",
                button1: (text: "아니요", action: { }),
                button2: (text: "네", action: {
                    viewModel.withdrawal()
                    self.xquareRouter.popToRoot()
                })
            )
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
        .sdPhotoPicker(
            isPresented: $viewModel.xPhotosIsPresented,
            selection: $viewModel.profileImage
        )
        .onChange(of: viewModel.profileImage, perform: { _ in
            viewModel.uploadImage()
        })
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("마이페이지")
        .onAppear(perform: viewModel.fetchProfile)
    }
}
