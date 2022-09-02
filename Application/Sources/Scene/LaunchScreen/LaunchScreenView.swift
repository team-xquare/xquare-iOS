import SwiftUI

import SemicolonDesign

struct LaunchScreenView: View {

    @StateObject var viewModel: LaunchScreenViewModel
    var onboardingView: OnboardingView
    var mainView: MainView

    var body: some View {
        ZStack {
            Color.Primary.purple400
                .ignoresSafeArea(edges: .all)
            Image.logo
                .frame(width: 250, height: 250, alignment: .center)
        }
        .fullScreenCover(isPresented: self.$viewModel.isSuccessToRefreshToken) {
            mainView
        }
        .fullScreenCover(isPresented: self.$viewModel.isFailureToRefreshToken) {
            onboardingView
        }
        .onAppear {
            self.viewModel.refreshToken()
        }
    }
}
