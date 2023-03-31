import SwiftUI
import SemicolonDesign

struct SelfStudyTeacherView: View {
    @StateObject var viewModel: SelfStudyTeacherViewModel
    @State var isReady: Bool = false
    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(0..<31) { _ in
                            SelfStudyTeacherCellView()
                                .padding(.horizontal, 16)
                        }
                    }
                }
                .opacity(isReady ? 1 : 0)
                .onChange(of: viewModel.dateToShowData) {
                    proxy.scrollTo($0, anchor: .top)
                    withAnimation(Animation.easeInOut.delay(0.3)) {
                        self.isReady = true
                    }
                }
            }
        }
        .onAppear(perform: viewModel.dateToShowDatas)
        .onDisappear { viewModel.dateToShowData = nil }
        .navigationTitle("자습감독 선생님 확인")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
    }
}
