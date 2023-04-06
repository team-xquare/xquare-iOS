import SwiftUI
import SemicolonDesign

struct SelfStudyTeacherView: View {
    @StateObject var viewModel: SelfStudyTeacherViewModel
    @State var isReady: Bool = false
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.selfStudyList, id: \.date) {
                            SelfStudyTeacherCellView(entity: $0, date: $0.date)
                                .padding([.horizontal, .top], 16)
                        }
                    }
                }
                .opacity(isReady ? 1 : 0)
                .onChange(of: self.viewModel.dateToShowData) {
                    proxy.scrollTo($0, anchor: .top)
                    withAnimation(Animation.easeInOut.delay(0.3)) {
                        self.isReady = true
                    }
                }
            }
        }
        .navigationTitle("자습감독 선생님 확인")
        .onAppear(perform: viewModel.fetchTodaySelfStudyTeacherPerMonth)
        .onDisappear { viewModel.dateToShowData = nil }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
    }
}
