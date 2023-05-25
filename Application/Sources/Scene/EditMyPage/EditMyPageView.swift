import SwiftUI

import SemicolonDesign

struct EditMyPageView: View {

    @StateObject var viewModel: EditMyPageViewModel
    @EnvironmentObject var xquareRouter: XquareRouter
    @State var datePickerIsShow: Bool = false
    var body: some View {
        VStack(
            alignment: .center,
            spacing: 0
        ) {
            Spacer().frame(height: 20)
            HStack(alignment: .center, spacing: 16) {
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
//            MyInformationTextField(title: "깃허브 계정", content: $viewModel.id)
            Spacer()
        }
        .sdPhotoPicker(
            isPresented: $viewModel.xPhotosIsPresented,
            selection: $viewModel.profileImage
        )
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    self.xquareRouter.dismissLast()
                } label: {
                    Text("완료")
                        .sdText(type: .body1)
                }
            }
        }
        .onChange(of: viewModel.profileImage, perform: { _ in
            viewModel.uploadImage()
        })
        .padding(.horizontal, 16)
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("마이페이지 수정")
        .onAppear(perform: viewModel.fetchProfile)
    }
}
