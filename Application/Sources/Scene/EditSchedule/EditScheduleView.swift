import SwiftUI

import SemicolonDesign

struct EditScheduleView: View {
    let editScheudle: () -> Void
    @Binding var title: String
    @Binding var day: String
    @Binding var isSuccess: Bool
    @State var editButtonIsDisabled: Bool = false
    @State var datePickerIsShow: Bool = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 0) {
            SDTextField(
                title: "일정제목",
                placeholder: "최소 2자 이상",
                text: $title
            )
            .padding(.top, 16)
            .onChange(of: title) { _ in
                checkStringDatasIsEmpty()
            }
            SDTextField(
                title: "날짜 선택",
                placeholder: "날짜를 선택해주세요",
                text: $day
            )
            .disabled(true)
            .padding(.top, 20)
            .onTapGesture {
                self.datePickerIsShow = true
            }
            .onChange(of: day) { _ in
                checkStringDatasIsEmpty()
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .sdDatePicker(isPresented: $datePickerIsShow, date: $day)
        .onChange(of: isSuccess) { isSuccess in
            if isSuccess {
                self.dismiss()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: editScheudle) {
                    Text("수정")
                        .sdText(
                            type: .body3,
                            textColor: editButtonIsDisabled ? .GrayScale.gray300 : .GrayScale.gray800
                        )
                }
                .disabled(editButtonIsDisabled)
            }
        }
        .onDisappear { self.isSuccess = false }
        .navigationTitle("일정 수정")
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
    private func checkStringDatasIsEmpty() {
        self.editButtonIsDisabled = title.isEmpty || day.isEmpty
    }
}
