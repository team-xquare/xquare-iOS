import SwiftUI

import AuthService
import MealDataService
import SemicolonDesign

struct MealDetailView: View {

    @StateObject var viewModel: MealDetailViewModel
    @State var isReady: Bool = false

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.menu, id: \.date) {
                            MealDetailCell(entity: $0)
                                .padding(.top, 16)
                        }
                    }
                }
                .opacity(isReady ? 1 : 0)
                .onChange(of: self.viewModel.dateToShowData) {
                    proxy.scrollTo($0, anchor: .top)
                    withAnimation(Animation.easeInOut.delay(0.3)) {
                        self.isReady = true
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("전체 급식")
            .onAppear(perform: viewModel.fetchMealMenuPerMonth)
            .setNavigationBackButton()
        }
    }
}
