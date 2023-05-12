import SwiftUI
import SemicolonDesign

struct ReleaseNoteView: View {
    @StateObject var viewModel: ReleaseNoteViewModel
    @State var isReady: Bool = false
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(0..<viewModel.releaseNoteList.count, id: \.self) { index in
                    ReleaseNoteCellView(
                        entity: viewModel.releaseNoteList[index],
                        index: viewModel.releaseNoteList.startIndex == index
                    )
                    .padding([.horizontal, .top], 16)
                    .id(index)
                }
            }
            .opacity(isReady ? 1 : 0)
            .onChange(of: self.viewModel.releaseNoteList) { _ in
                withAnimation(Animation.easeInOut.delay(0.3)) {
                    self.isReady = true
                }
            }
        }
        .navigationTitle("업데이트 사항")
        .onAppear(perform: viewModel.fetchReleaseNote)
        .onDisappear(perform: viewModel.resetReleaseNoteList)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
    }
}
