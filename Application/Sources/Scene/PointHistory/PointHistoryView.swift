import SwiftUI

import PointService
import SemicolonDesign

struct PointHistoryView: View {

    @StateObject var viewModel: PointHistoryViewModel
    @State var isGoodPointButtonSelected: Bool = true
    @State var isBadPointButtonSelected: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            Text("상점 \(viewModel.pointHistories.goodPoint)점 벌점 \(viewModel.pointHistories.badPoint)점")
                .sdText(type: .body4)
                .padding(.horizontal, 16)

            HStack {
                SelectButtonView(selection: $isGoodPointButtonSelected, text: "상점") {
                    self.isBadPointButtonSelected = false
                    self.viewModel.fetchPointHistory(type: .goodPoint)
                }
                SelectButtonView(selection: $isBadPointButtonSelected, text: "벌점") {
                    self.isGoodPointButtonSelected = false
                    self.viewModel.fetchPointHistory(type: .badPoint)
                }
            }
            .padding([.horizontal, .vertical], 16)

            List(viewModel.pointHistories.pointHistories, id: \.id) {
                PointHistoryListCellView(pointHistory: $0)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.inset)

        }
        .navigationTitle("상벌점 내역")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
        .onAppear { viewModel.fetchPointHistory(type: .goodPoint) }
    }
}
