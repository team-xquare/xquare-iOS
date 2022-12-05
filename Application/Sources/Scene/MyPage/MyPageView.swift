import SwiftUI

import SemicolonDesign

struct MyPageView: View {

    @StateObject var viewModel: MyPageViewModel

    var body: some View {
        VStack(
            alignment: .center,
            spacing: 0
        ) {
            Image(uiImage: viewModel.profileImage)
                .frame(width: 60, height: 60)
            SDTextField(title: "이름", text: $viewModel.name)
            SDTextField(title: "생년월일", text: $viewModel.birthDay)
            SDTextField(title: "학년 반 번호", text: $viewModel.gradeClassNumber)
            SDTextField(title: "아이디", text: $viewModel.id)
        }
    }

}
