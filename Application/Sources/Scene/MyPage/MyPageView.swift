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
            VStack(alignment: .leading, spacing: 0) {
                Rectangle().frame(height: 0)
                MyProfileView(
                    imageUrl: viewModel.profileImagrUrl,
                    uiimage: $viewModel.profileImage,
                    name: viewModel.name,
                    gradeClassNum: viewModel.gradeClassNum,
                    xPhotosIsPresented: $viewModel.xPhotosIsPresented
                )
                .padding([.leading, .top], 16)
                MyInfoIDAndBirthDay(id: viewModel.id, birthDay: viewModel.birthDay)
            }
            .background(Color.GrayScale.gray50)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.GrayScale.gray300)
            }
            .padding(.horizontal, 16)
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
