import SwiftUI

import SemicolonDesign
import XNavigationAndTab

struct EntireView: View, XNavigationAndTabContent {

    @StateObject var viewModel: EntireViewModel

    var pointHistoryView: PointHistoryView
    var myPageView: MyPageView
    var bugReportView: BugReportView

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
            LazyVStack(spacing: 27) {
                TopServiceMenuView(
                    pointHistoryView: pointHistoryView,
                    myPageView: myPageView,
                    bugReportView: bugReportView
                )
                ServiceSectionButtonView(
                    headerText: "사용자",
                    services: [
                        (text: "로그아웃", action: { viewModel.showLogoutAlert = true })
                    ])
                Spacer()
            }
        }
        .navigationTitle("전체")
        .onAppear { self.viewModel.isDidLogout = false }
        .sdAlert(isPresented: $viewModel.showLogoutAlert) {
            SDAlert(
                title: "정말 로그아웃 하시겠습니까?",
                button1: (text: "네", action: {
                    viewModel.logout()
                    viewModel.showLogoutAlert = false
            }),
                button2: (text: "아니요", action: {
                    viewModel.showLogoutAlert = false
                })
            )
        }
    }
}

// 임시
struct ServiceSection {
    var headerText: String
    var services: [String]
}
