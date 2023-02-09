import SwiftUI

import SemicolonDesign

struct WriteScheduleView: View {
    @StateObject var viewModel: WriteScheduleViewModel

    var body: some View {
        VStack(spacing: 0) {
            SDTextField(
                title: "일정제목",
                placeholder: "최소 2자 이상",
                text: $viewModel.title
            )
            .padding(.top, 16)
            SDTextField(
                title: "날짜 선택",
                placeholder: "날짜를 선택해주세요",
                text: $viewModel.day
            )
            .disabled(true)
            .padding(.top, 20)

            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("!!!!!")
                } label: {
                    Text("등록")
                        .sdText(
                            type: .body3,
                            textColor: viewModel.postButtonIsDisabled ? .GrayScale.gray300 : .GrayScale.gray800
                        )
                }
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("일정 작성")
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}
