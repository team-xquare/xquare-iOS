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
        .background(Color.GrayScale.gray50)
        .onAppear(perform: viewModel.fetchTodaysMeal)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                }, label: {
                    Image(systemName: "square.fill")
                        .font(.system(size: 24))
                        .tint(.GrayScale.gray200)
                })
                Button(action: {
                }, label: {
                    Image(systemName: "square.fill")
                        .font(.system(size: 24))
                        .tint(.GrayScale.gray200)
                })
            }
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let dependency = MealDataServiceDependency.resolve()
        let mealDetailView = MealDetailView(
            viewModel: MealDetailViewModel()
        )
        // MARK: - ViewModels
        let homeViewModel = HomeViewModel(
            fetchMealMenuPerDayUseCase: dependency.fetchDayToMealMenuUseCase
        )
        HomeView(
            viewModel: homeViewModel,
            mealDetailView: mealDetailView
        )
    }
}
