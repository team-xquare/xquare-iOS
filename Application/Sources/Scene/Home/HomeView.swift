import SwiftUI

import MealDataService

import SemicolonDesign
import XNavigationAndTab

struct HomeView: View, XNavigationAndTabContent {

    @StateObject var viewModel: HomeViewModel
    var mealDetailView: MealDetailView

    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "홈",
            tabItemImage: .home,
            backgroundColor: .GrayScale.gray50
        )
    }

    var body: some View {
        ScrollView {
            VStack {
                Spacer().frame(height: 5)
                ProfileView(
                    imageUrl: viewModel.imageUrl,
                    name: viewModel.name,
                    merit: viewModel.merit,
                    demerit: viewModel.demerit
                )
                Spacer().frame(height: 16)
                MealMenuView(
                    mealDetailView: mealDetailView,
                    menu: viewModel.menu
                )
            }
            .padding([.leading, .trailing], 16)
        }
        .onTabSelected(tabIndex: 0, perform: {
            viewModel.fetchTodaysMeal()
            viewModel.fetchUserPoint()
        })
        .onAppear {
            viewModel.fetchTodaysMeal()
            viewModel.fetchUserPoint()
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.GrayScale.gray50)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
               Text("홈")
                    .sdText(type: .heading6, textColor: .GrayScale.gray900)
                    .padding(.leading, 5)
            }
        }
    }

}
