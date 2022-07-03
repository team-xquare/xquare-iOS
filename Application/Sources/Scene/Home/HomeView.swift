import SwiftUI
import SemicolonDesign

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        ZStack {
            Color.GrayScale.gray50.ignoresSafeArea()
            VStack(spacing: 16) {
                Spacer()
                    .frame(height: 61)
                PointsView(
                    imageUrl: viewModel.imageUrl,
                    name: viewModel.name,
                    comment: viewModel.comment
                )
                MealMenuView(menu: viewModel.menu)
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let homeViewModel = HomeViewModel()
        HomeView(viewModel: homeViewModel)
    }
}
