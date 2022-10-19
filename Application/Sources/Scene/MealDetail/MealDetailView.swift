import SwiftUI

import AuthService
import MealDataService

struct MealDetailView: View {
    @StateObject var viewModel: MealDetailViewModel

    var body: some View {
        List(
            viewModel.menu,
            id: \.date
        ) {
            MealDetailCell(entity: $0)
                .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
        .navigationTitle("전체 급식")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.fetchMealMenuPerMonth()
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mealDataService = MealDataServiceDependency.shared
        let viewModel = MealDetailViewModel(
            fetchMealMenuPerMonthUseCase: mealDataService.fetchMonthToMealMenuUseCase
        )
        MealDetailView(viewModel: viewModel)
    }
}
