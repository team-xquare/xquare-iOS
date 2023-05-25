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
            Spacer().frame(height: 20)
            HStack(alignment: .center, spacing: 16) {
//                AsyncImage(url: viewModel.profileImagrUrl) { image in
//                    image
//                        .resizable()
//                        .scaledToFill()
//                } placeholder: {
//                    Image("DefaultImage")
//                }
//                .frame(width: 60, height: 60)
//                .cornerRadius(30)
                ProfileImageView(
                    imageUrl: viewModel.profileImagrUrl,
                    uiimage: $viewModel.profileImage
                ).onTapGesture {
                    viewModel.xPhotosIsPresented = true
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text(viewModel.name)
                        .sdText(type: .body1, textColor: .GrayScale.gray900)
                    Text(viewModel.gradeClassNum)
                        .sdText(type: .body2, textColor: .GrayScale.gray900)
                }
                Spacer()
            }
            .padding(.bottom, 20)
            .padding(.leading, 4)
            MyInformationView(title: "아이디", content: viewModel.id)
            MyInformationView(title: "생년월일", content: viewModel.birthDay)
//            MyInformationView(title: "깃허브 계정", content: viewModel.id)
            Spacer()
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
            .padding(.bottom, 40)
        }
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
//        .toolbar {
//            ToolbarItemGroup(placement: .navigationBarTrailing) {
//                Button {
//                    self.xquareRouter.navigateTo(.editMyPage)
//                } label: {
//                    Text("수정")
//                        .sdText(type: .body1)
//                }
//            }
//        }
        .sdPhotoPicker(
            isPresented: $viewModel.xPhotosIsPresented,
            selection: $viewModel.profileImage
        )
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
