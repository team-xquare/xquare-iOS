import SwiftUI

import SemicolonDesign

struct BugReportView: View {
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
                    TextEditor(text: $viewModel.content)
                    Spacer()
                }
                DropDownSelector(selectedOptions: $viewModel.bugPlace)
                    .padding(.bottom, 16)
            }
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
        .navigationTitle("버그 제보")
        .navigationBarTitleDisplayMode(.inline)
    }
}
