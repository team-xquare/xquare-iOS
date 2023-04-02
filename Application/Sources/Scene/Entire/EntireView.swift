import SwiftUI

import XNavigationAndTab

struct EntireView: View, XNavigationAndTabContent {

    @State var services = [
        ServiceSection(
            headerText: "학교",
            services: ["동아리 지원하기", "오늘의 자습감독 선생님", "랭킹"]
        ),
        ServiceSection(
            headerText: "기숙사",
            services: ["봉사 지원하기", "청소판 확인하기"]
        )
    ]

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
                Spacer()
            }
        }
        .navigationTitle("전체")
    }
}

// 임시
struct ServiceSection {
    var headerText: String
    var services: [String]
}
