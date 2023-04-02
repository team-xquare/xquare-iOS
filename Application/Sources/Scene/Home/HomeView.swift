import SwiftUI

import MealDataService

import SemicolonDesign
import XNavigationAndTab

struct HomeView: View, XNavigationAndTabContent {

    @EnvironmentObject var homeRouter: HomeRouter
    @StateObject var viewModel: HomeViewModel

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
                    menu: viewModel.menu
                )
                if viewModel.isShowOutingView {
                    OutingView(
                        name: viewModel.name,
                        endTime: viewModel.endTime
                    )
                }
                if viewModel.isShowMovedClass {
                    MovedClassView(
                        name: viewModel.name,
                        locationClassroom: viewModel.locationClassroom,
                        comeBackClassroom: viewModel.deleteReturnClass
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
                Button {
                    homeRouter.navigateTo(.notification)
                } label: {
                    Image.bell
                        .frame(width: 24, height: 24)
                }
            }
        }
        .sdOkayAlert(isPresented: $viewModel.isPresentErrorAlert, sdAlert: {
            SDOkayAlert(title: "교실로 이동할 수 없습니다.", message: "관리에게 문의해주세요!")
        })
        .sdOkayAlert(isPresented: $viewModel.isSuccessReturnClass, sdAlert: {
            SDOkayAlert(title: "이동 완료", message: "교실로 이동하였습니다.")
        })
    }

}
