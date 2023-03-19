import SwiftUI

import MealDataService

import SemicolonDesign
import XNavigationAndTab

struct HomeView: View, XNavigationAndTabContent {

    @StateObject var viewModel: HomeViewModel
    var mealDetailView: MealDetailView
    let notificationView: NotificationView
    let outingPassView: OutingPassView

    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "홈",
            tabItemImage: .home,
            backgroundColor: .GrayScale.gray50
        )
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ProfileView(
                    imageUrl: viewModel.imageUrl,
                    name: viewModel.name,
                    merit: viewModel.merit,
                    demerit: viewModel.demerit
                )
                MealMenuView(
                    mealDetailView: mealDetailView,
                    menu: viewModel.menu
                )
                if viewModel.isShowOutingView {
                    OutingView(
                        outingPassView: outingPassView,
                        name: viewModel.name,
                        endTime: viewModel.endTime
                    )
                }
                if viewModel.isShowMovedClass {
                    MovedClassView(
                        name: viewModel.name,
                        locationClassroom: viewModel.locationClassroom,
                        comeBackClassroom: {
                            viewModel.deleteReturnClass()
                        }
                    )
                }
            }
            .padding(.horizontal, 16)
        }
        .onTabSelected(tabIndex: 0, perform: {
            viewModel.fetchTodaysMeal()
            viewModel.fetchUserPoint()
            viewModel.fetchOutingPass()
            viewModel.fetchMovedClass()
        })
        .onAppear {
            viewModel.fetchTodaysMeal()
            viewModel.fetchUserPoint()
            viewModel.fetchOutingPass()
            viewModel.fetchMovedClass()
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.GrayScale.gray50)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
               Text("홈")
                    .sdText(type: .heading6, textColor: .GrayScale.gray900)
                    .padding(.leading, 5)
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                NavigationLink(destination: notificationView) {
                    Image.bell
                        .frame(width: 24, height: 24)
                }
            }
        }
        .sdErrorAlert(isPresented: $viewModel.isPresentErrorAlert,
            sdAlert: {
            SDErrorAlert(errerMessage: "교실 복귀에 문제가 발생하였습니다.")
        })
    }

}
