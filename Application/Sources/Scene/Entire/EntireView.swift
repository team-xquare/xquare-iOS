import SwiftUI

import SemicolonDesign
import XNavigationAndTab

struct EntireView: View, XNavigationAndTabContent {
    @StateObject var viewModel: EntireViewModel
    @EnvironmentObject var xquareRouter: XquareRouter

    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "전체",
            tabItemImage: .entire
        )
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 27) {
                VStack(spacing: 27) {
                    TopServiceMenuView()
                    ServiceSectionButtonView(
                        headerText: "학교",
                        services: [
                            (text: "오늘의 자습감독 선생님",
                             action: { xquareRouter.navigateTo(.selfStudyTeacher) },
                             textColor: .GrayScale.gray900)
                        ]
                    )
                    ServiceSectionButtonView(
                        headerText: "앱",
                        services: [
                            (text: "업데이트 사항",
                             action: { xquareRouter.navigateTo(.releaseNote) },
                             textColor: .GrayScale.gray900)
                        ]
                    )
                    Spacer()
                }
            }
            .navigationTitle("전체")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
