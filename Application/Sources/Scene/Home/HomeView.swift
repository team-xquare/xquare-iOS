import SwiftUI
import SemicolonDesign

import MealDataService

struct HomeView: View {

    @StateObject var viewModel: HomeViewModel

    var body: some View {
        NavigationView {
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
                        breakfast: viewModel.breakfast,
                        lunch: viewModel.lunch,
                        dinner: viewModel.dinner
                    )
                }
                .padding([.leading, .trailing], 16)
            }
            .background(Color.GrayScale.gray50)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("")
                    }, label: {
                        Image(systemName: "square.fill")
                            .font(.system(size: 24))
                            .tint(.GrayScale.gray200)
                    })
                    Button(action: {
                        print("")
                    }, label: {
                        Image(systemName: "square.fill")
                            .font(.system(size: 24))
                            .tint(.GrayScale.gray200)
                    })
                }
            }
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let dependency = MealDataServiceDependency.resolve()
        // MARK: - ViewModels
        let homeViewModel = HomeViewModel(
            fetchDayToMealMenuUseCase: dependency.fetchDayToMealMenuUseCase
        )
        HomeView(viewModel: homeViewModel)
    }
}
