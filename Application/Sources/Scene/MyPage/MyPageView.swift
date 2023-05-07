import SwiftUI

import SemicolonDesign

struct MyPageView: View {

    @StateObject var viewModel: MyPageViewModel
    @EnvironmentObject var xquareRouter: XquareRouter

    var body: some View {
        VStack(
            alignment: .center,
            spacing: 0
        ) {
            Spacer()
                .frame(height: 34)
            ProfileImageView(
                imageUrl: viewModel.profileImagrUrl,
                uiimage: $viewModel.profileImage
            )
            Button {
                viewModel.xPhotosIsPresented = true
            } label: {
                Text("변경하기")
                    .sdText(type: .body4, textColor: .GrayScale.gray900)
            }
            .padding(.bottom, 6)
            MyInformationView(title: "이름", content: viewModel.name)
            MyInformationView(title: "생년월일", content: viewModel.birthDay)
            MyInformationView(title: "학년 반 번호", content: viewModel.gradeClassNum)
            MyInformationView(title: "아이디", content: viewModel.id)
            Button(action: {
                viewModel.showLogoutAlert = true
            }, label: {
                Text("회원탈퇴")
                    .sdText(type: .body3, textColor: Color.System.red700)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(Color.System.red50)
                    .cornerRadius(8)
            })
            Spacer()
        }
        .sdPhotoPicker(
            isPresented: $viewModel.xPhotosIsPresented,
            selection: $viewModel.profileImage
        )
        .sdAlert(isPresented: $viewModel.showLogoutAlert) {
            SDAlert(
                title: "정말 회원탈퇴 하시겠습니까?",
                button1: (text: "아니요", action: { }),
                button2: (text: "네", action: {
                    viewModel.withdrawal()
                    self.xquareRouter.popToRoot()
                })
            )
        }
        .onChange(of: viewModel.profileImage, perform: { _ in
            viewModel.uploadImage()
        })
        .padding(.horizontal, 16)
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("마이페이지")
        .onAppear(perform: viewModel.fetchProfile)
    }
}
