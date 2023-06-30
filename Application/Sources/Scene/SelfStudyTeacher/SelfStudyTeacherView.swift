import SwiftUI
import SemicolonDesign

struct SelfStudyTeacherView: View {
    @StateObject var viewModel: SelfStudyTeacherViewModel
    @State var isReady: Bool = false
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach(0..<viewModel.selfStudyList.count, id: \.self) { index in
                            SelfStudyTeacherCellView(
                                entity: viewModel.selfStudyList[index],
                                date: viewModel.selfStudyList[index].date
                            )
                            .padding([.horizontal, .top], 16)
                            .id(index)
                        }
                    }
                }
                .padding(.bottom, 16)
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
