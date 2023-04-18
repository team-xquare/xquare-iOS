import SwiftUI

struct TopServiceMenuView: View {
    @EnvironmentObject var xquareRouter: XquareRouter

    var body: some View {
        HStack(spacing: 9) {
            TopServiceMenuCellView(image: .thumbUpIcon, text: "상벌점 내역") {
                self.xquareRouter.navigateTo(.pointHistory)
            }
            TopServiceMenuCellView(image: .userIcon, text: "마이페이지") {
                self.xquareRouter.navigateTo(.myPage)
            }
            TopServiceMenuCellView(image: .warningTriangleIcon, text: "버그 제보") {
                self.xquareRouter.navigateTo(.bugReport)
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 27)
        .padding(.bottom, 3)
    }

}
