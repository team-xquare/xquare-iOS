import SwiftUI

import SemicolonDesign

struct BugReportView: View {
    @State private var showDropDown: Bool = false
    @StateObject var viewModel: BugReportViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                    .frame(height: 16)

                ImportantTextView(text: "어디서 버그가 발생했나요?")
                    .padding(.bottom, 8)

                ZStack(alignment: .topLeading) {
                    VStack(alignment: .leading, spacing: 0) {
                        Spacer()
                            .frame(height: 48)
                        ImportantTextView(text: "사진을 첨부해주세요", isImportant: false)
                            .padding(.bottom, 8)
                        BugImageView(
                            isLoading: $viewModel.isLoading,
                            uiimage: $viewModel.bugImage,
                            isEmpty: $viewModel.isEmpty,
                            xPhotosIsPresented: $viewModel.xPhotosIsPresented
                        )
                        ImportantTextView(text: "버그에 대해 요약해서 설명해주세요.")
                            .padding(.bottom, 8)
                        SDTextEditor(placeholder: "설명을 입력하세요.", text: $viewModel.content)
                            .frame(minHeight: 100, maxHeight: 200)
                            .onChange(of: viewModel.content) { _ in
                                viewModel.checkBugPlaceAndContentIsEmpty()
                            }
                            .padding(.bottom, 8)
                        Spacer()
                    }
                    DropDownSelector(
                        showDropDown: $showDropDown,
                        selectedOptions: $viewModel.bugPlace
                    )
                    .padding(.bottom, 16)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: viewModel.postBug) {
                    Text("제출")
                        .sdText(
                            type: .body4,
                            textColor: viewModel.isDisabled ? .GrayScale.gray400 : .GrayScale.gray800
                        )
                }
                .disabled(viewModel.isDisabled)
            }
        }
        .sdPhotoPicker(
            isPresented: $viewModel.xPhotosIsPresented,
            selection: $viewModel.bugImage
        )
        .sdOkayAlert(isPresented: $viewModel.networking, sdAlert: {
            SDOkayAlert(title: "버그제보", message: "제보 감사합니다! 사용자님들의 제보로 더 나은 스퀘어를 만들어갑니다!")
        })
        .onAppear {viewModel.viewAppear()}
        .onChange(of: viewModel.bugImage, perform: { _ in
            viewModel.isLoading = true
            viewModel.uploadImage()
        })
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
        .navigationTitle("버그 제보")
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture { showDropDown = false }
    }
}
