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
        ScrollView {
            LazyVStack(spacing: 27) {
                VStack(spacing: 27) {
                    TopServiceMenuView()
                    ServiceSectionView(
                        headerText: "학교",
                        services: [(text: "오늘의 자습감독 선생님", view: .selfStudyTeacher)]
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
            .onChange(of: viewModel.isDidLogout, perform: { isLogout in
                if isLogout {
                    self.xquareRouter.popToRoot()
                }
            })
            .sdAlert(isPresented: $viewModel.showLogoutAlert) {
                SDAlert(
                    title: "정말 로그아웃 하시겠습니까?",
                    button1: (text: "네", action: {
                        viewModel.logout()
                    }),
                    button2: (text: "아니요", action: { })
                )
            }
        }
    }
}
