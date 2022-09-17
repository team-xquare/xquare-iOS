import SwiftUI

struct MealDetailView: View {
    @StateObject var viewModel: MealDetailViewModel

    var body: some View {
        NavigationView {
            List(
                viewModel.menu,
                id: \.date
            ) {
                MealDetailCell(entity: $0)
                    .listRowSeparator(.hidden)
            }
            .navigationTitle("전체 급식")
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MealDetailViewModel()
        MealDetailView(viewModel: viewModel)
    }
}
