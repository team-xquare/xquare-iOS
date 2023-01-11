import SwiftUI

struct TopServiceMenuView: View {

    var pointHistoryView: PointHistoryView
    var myPageView: MyPageView
    var bugReportView: BugReportView

    var body: some View {
        HStack(spacing: 9) {
            TopServiceMenuCellView(image: .thumbUpIcon, text: "상벌점 내역") {
                pointHistoryView
            }
            TopServiceMenuCellView(image: .userIcon, text: "마이페이지") {
                myPageView
            }
            TopServiceMenuCellView(image: .warningTriangleIcon, text: "버그 제보") {
                bugReportView
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 27)
        .padding(.bottom, 3)
    }

}
