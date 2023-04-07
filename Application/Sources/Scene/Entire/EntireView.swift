import SwiftUI

import XNavigationAndTab

struct EntireView: View, XNavigationAndTabContent {

var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "전체",
            tabItemImage: .entire
        )
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 27) {
                TopServiceMenuView()
                ServiceSectionView(
                    headerText: "학교",
                    services: [(text: "오늘의 자습감독 선생님", view: .selfStudyTeacher)]
                )
                Spacer()
            }
        }
        .navigationTitle("전체")
    }
}
