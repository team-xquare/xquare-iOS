import SwiftUI

import AuthService
import MealDataService
import SemicolonDesign

struct MealDetailView: View {

    @StateObject var viewModel: MealDetailViewModel
    @State var isReady: Bool = false

    var body: some View {
        VStack {
            if viewModel.menu != [] {
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(0..<viewModel.menu.count, id: \.self) { index in
                                MealDetailCell(entity: viewModel.menu[index])
                                    .padding(.top, 16)
                                    .id(index)
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
            }
        }
        .navigationTitle("전체 급식")
        .onAppear(perform: viewModel.fetchMealMenuPerMonth)
        .onDisappear { viewModel.dateToShowData = nil }
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
    }
}
