import SwiftUI

struct TopServiceMenuView: View {

    @EnvironmentObject var entireRouter: EntireRouter

    var body: some View {
        HStack(spacing: 9) {
            TopServiceMenuCellView(image: .thumbUpIcon, text: "상벌점 내역") {
                entireRouter.navigateTo(.pointHistory)
            }
            TopServiceMenuCellView(image: .userIcon, text: "마이페이지") {
                entireRouter.navigateTo(.myPage)
            }
            TopServiceMenuCellView(image: .warningTriangleIcon, text: "버그 제보") {
                entireRouter.navigateTo(.bugReport)
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 27)
        .padding(.bottom, 3)
    }

}
