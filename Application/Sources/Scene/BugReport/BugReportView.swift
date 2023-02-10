import SwiftUI

import SemicolonDesign

struct BugReportView: View {
    @State private var showDropDown: Bool = false
    @StateObject var viewModel: BugReportViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
                .frame(height: 16)

            ImportantTextView(text: "어디서 버그가 발생했나요?")
                .padding(.bottom, 8)

            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                        .frame(height: 48)

                    ImportantTextView(text: "버그에 대해 요약해서 설명해주세요.")
                        .padding(.bottom, 8)

                    SDTextEditor(placeholder: "설명을 입력하세요.", text: $viewModel.content)
                        .frame(minHeight: 100, maxHeight: 200)
                        .onChange(of: viewModel.content) { _ in
                            viewModel.checkBugPlaceAndContentIsEmpty()
                        }

                    Spacer()
                }
                DropDownSelector(
                    showDropDown: $showDropDown,
                    selectedOptions: $viewModel.bugPlace
                )
                .padding(.bottom, 16)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                } label: {
                    Text("제출")
                        .sdText(
                            type: .body4,
                            textColor: viewModel.isDisabled ? .GrayScale.gray200 : .GrayScale.gray800
                        )
                }
                .disabled(viewModel.isDisabled)
            }
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
        .navigationTitle("버그 제보")
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture { showDropDown = false }
    }
}