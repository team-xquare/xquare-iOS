import SwiftUI

import SemicolonDesign
import XPhotos

struct MyPageView: View {

    @StateObject var viewModel: MyPageViewModel

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
            Spacer()
        }
        .xPhotoPicker(
            isPresented: $viewModel.xPhotosIsPresented,
            selection: $viewModel.profileImage
        )
        .onChange(of: viewModel.profileImage, perform: { _ in
        })
        .padding(.horizontal, 16)
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("마이페이지")
        .onAppear(perform: viewModel.fetchProfile)
    }
}
