import SwiftUI

import SemicolonDesign

struct PointHistoryView: View {

    @State var selectedIndex: Int = 0

    var body: some View {
        VStack(alignment: .leading) {

            Text("상점 1점 벌점 20점")
                .sdText(type: .body4)
                .padding(.horizontal, 16)

            Selector(
                selectedIndex: self.$selectedIndex,
                buttonTitles: ["상점", "벌점"]
            )
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
