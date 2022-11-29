import SwiftUI

struct TopServiceMenuView: View {

    var pointHistoryView: PointHistoryView

    var body: some View {
        HStack(spacing: 9) {
            TopServiceMenuCellView(image: .thumbUpIcon, text: "상벌점 내역") {
                pointHistoryView
            }
            TopServiceMenuCellView(image: .userIcon, text: "마이페이지") {
                Text("마이페이지")
            }
            TopServiceMenuCellView(image: .warningTriangleIcon, text: "버그 제보") {
                Text("버그 제보")
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 27)
        .padding(.bottom, 3)
    }

}
