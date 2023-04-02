import SwiftUI

import AuthService

class FeedRouterFactory: RouterFactory {

    let feedView: FeedView

    init() {
        let authServiceDependency = AuthServiceDependency.shared

        let feedViewModel = FeedViewModel(
            fetchAccessTokenUseCase: authServiceDependency.fetchAccessTokenUseCase,
            refreshTokenIfExpiredUseCase: authServiceDependency.refreshTokenIfExpiredUseCase
        )
        self.feedView = FeedView(viewModel: feedViewModel)
    }

    @ViewBuilder func makeBody(for screen: FeedRoute) -> some View {
        self.feedView
    }
}
