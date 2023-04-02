import SwiftUI

import AuthService

class ApplicationRouterFactory: RouterFactory {
    let applicationView: ApplicationView

    init() {
        let authServiceDependency = AuthServiceDependency.shared

        let applicationViewModel = ApplicationViewModel(
            fetchAccessTokenUseCase: authServiceDependency.fetchAccessTokenUseCase,
            refreshTokenIfExpiredUseCase: authServiceDependency.refreshTokenIfExpiredUseCase
        )
        self.applicationView = ApplicationView(viewModel: applicationViewModel)
    }

    @ViewBuilder func makeBody(for screen: ApplicationRoute) -> some View {
        self.applicationView
    }
}
