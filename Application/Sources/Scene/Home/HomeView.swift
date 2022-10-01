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
            tabItemImage: Image(systemName: "square.fill"),
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
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.GrayScale.gray50)
        .onAppear(perform: viewModel.fetchTodaysMeal)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                }, label: {
                    Image(systemName: "square.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .tint(.GrayScale.gray200)
                })
                Button(action: {
                }, label: {
                    Image.settingIcon
                        .resizable()
                        .frame(width: 24, height: 24)
                        .tint(.GrayScale.gray200)
                })
            }
        }
    }

}
