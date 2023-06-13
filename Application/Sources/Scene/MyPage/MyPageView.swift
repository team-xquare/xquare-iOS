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
            Spacer()
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
