import SwiftUI

import PointService
import SemicolonDesign

struct PointHistoryView: View {

    @State var viewModel: PointHistoryViewModel
    @State var isGoodPointButtonSelected: Bool = true
    @State var isBadPointButtonSelected: Bool = false

    var body: some View {
        VStack(alignment: .leading) {

            Text("상점 \(viewModel.pointHistories.goodPoint)점 벌점 \(viewModel.pointHistories.badPoint)점")
                .sdText(type: .body4)
                .padding(.horizontal, 16)

            HStack {
                SelectButtonView(selection: $isGoodPointButtonSelected, text: "상점") {
                    self.viewModel.type = true
                    self.isBadPointButtonSelected = false
                }
                .onChange(of: isGoodPointButtonSelected) {
                    if $0 {
                        self.viewModel.fetchPointHistory()
                    }
                }
                SelectButtonView(selection: $isBadPointButtonSelected, text: "벌점") {
                    self.viewModel.type = false
                    self.isGoodPointButtonSelected = false
                }
                .onChange(of: isBadPointButtonSelected) {
                    if $0 {
                        self.viewModel.fetchPointHistory()
                    }
                }
            }
            .padding([.horizontal, .vertical], 16)

            List(viewModel.pointHistories.pointHistories, id: \.id) {
                PointHistoryListCellView(pointHistory: $0)
                    .padding(.horizontal, 16)
            }

        }
        .navigationTitle("상벌점 내역")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
        .onAppear(perform: viewModel.fetchPointHistory)
    }
}
