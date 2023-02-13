import SwiftUI

import SemicolonDesign

struct WriteScheduleView: View {
    @StateObject var viewModel: WriteScheduleViewModel
    @State var datePickerIsShow: Bool = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 0) {
            SDTextField(
                title: "일정제목",
                placeholder: "최소 2자 이상",
                text: $viewModel.title
            )
            .padding(.top, 16)
            .onChange(of: viewModel.title) { _ in
                viewModel.checkStringDatasIsEmpty()
            }
            SDTextField(
                title: "날짜 선택",
                placeholder: "날짜를 선택해주세요",
                text: $viewModel.day
            )
            .disabled(true)
            .padding(.top, 20)
            .onTapGesture {
                self.datePickerIsShow = true
            }
            .onChange(of: viewModel.day) { _ in
                viewModel.checkStringDatasIsEmpty()
            }

            Spacer()
        }
        .padding(.horizontal, 16)
        .sdDatePicker(isPresented: $datePickerIsShow, date: $viewModel.day)
        .onChange(of: viewModel.isSuccess) { isSuccess in
            if isSuccess {
                dismiss()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: viewModel.createSchedule) {
                    Text("등록")
                        .sdText(
                            type: .body3,
                            textColor: viewModel.postButtonIsDisabled ? .GrayScale.gray300 : .GrayScale.gray800
                        )
                }
                .disabled(viewModel.postButtonIsDisabled)
            }
        }
        .navigationTitle("일정 작성")
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}
