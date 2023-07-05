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
            AccountManagementView(
                services: [
                    ("로그아웃", { viewModel.showLogoutAlert = true })
                ]
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
