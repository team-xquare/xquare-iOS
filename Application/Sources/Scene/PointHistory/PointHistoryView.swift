import SwiftUI

import SemicolonDesign

struct PointHistoryView: View {

    @State var isGoodPointButtonSelected: Bool = true
    @State var isBadPointButtonSelected: Bool = false

    var body: some View {
        VStack(alignment: .leading) {

            Text("상점 1점 벌점 20점")
                .sdText(type: .body4)
                .padding(.horizontal, 16)

            HStack {
                SelectButtonView(selection: $isGoodPointButtonSelected, text: "상점") {
                    self.isBadPointButtonSelected = false
                }
                SelectButtonView(selection: $isBadPointButtonSelected, text: "벌점") {
                    self.isGoodPointButtonSelected = false
                }
            }
            .padding([.horizontal, .vertical], 16)

            ScrollView {
                LazyVStack(spacing: 8) {
                    PointHistoryListCellView(date: Date(), reason: "그냥", point: 5)
                    PointHistoryListCellView(date: Date(), reason: "그냥", point: 5)
                    PointHistoryListCellView(date: Date(), reason: "그냥", point: 5)
                    PointHistoryListCellView(date: Date(), reason: "그냥", point: 5)
                    PointHistoryListCellView(date: Date(), reason: "그냥", point: 5)
                    PointHistoryListCellView(date: Date(), reason: "그냥", point: 5)
                    PointHistoryListCellView(date: Date(), reason: "그냥", point: 5)
                    PointHistoryListCellView(date: Date(), reason: "그냥", point: 5)
                    PointHistoryListCellView(date: Date(), reason: "그냥", point: 5)
                    PointHistoryListCellView(date: Date(), reason: "그냥", point: 5)
                }
                .padding(.horizontal, 16)
            }

        }
        .navigationTitle("상벌점 내역")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
    }
}
