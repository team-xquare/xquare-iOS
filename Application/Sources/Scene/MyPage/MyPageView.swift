import SwiftUI

import SemicolonDesign

struct MyPageView: View {

    @StateObject var viewModel: MyPageViewModel

    var body: some View {
        VStack(
            alignment: .center,
            spacing: 0
        ) {
            Spacer()
                .frame(height: 34)
            Image(uiImage: viewModel.profileImage)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .background(.black)
                .cornerRadius(30)
                .padding(.bottom, 6)
            Button {
                viewModel.showActionSheet = true
            } label: {
                Text("변경하기")
                    .sdText(type: .body4, textColor: .GrayScale.gray900)
            }
            .padding(.bottom, 6)
            MyInformationView(title: "이름", content: viewModel.name)
            MyInformationView(title: "생년월일", content: viewModel.birthDay)
            MyInformationView(title: "학년 반 번호", content: viewModel.gradeClassNumber)
            MyInformationView(title: "아이디", content: viewModel.id)
            Spacer()
        }
        .padding(.horizontal, 16)
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("마이페이지")
    }
}
