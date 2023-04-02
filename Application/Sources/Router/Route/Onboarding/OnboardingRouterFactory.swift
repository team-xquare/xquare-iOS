import SwiftUI

import AuthService

class OnboardingRouterFactory: RouterFactory {
    let launchSCreenView: LaunchScreenView
    let loginView: LoginView
    let signupView: SignupView
    let onboardingView: OnboardingView
    let mainView: MainView

    init() {
        let authServiceDependency = AuthServiceDependency.shared

        let launchScreenViewModel = LaunchScreenViewModel(
            refreshTokenUseCase: authServiceDependency.refreshTokenUseCase
        )
        self.launchSCreenView = LaunchScreenView(viewModel: launchScreenViewModel)

        let loginViewModel = LoginViewModel(
            signInUseCase: authServiceDependency.signinUseCase,
            autoLoginUseCase: authServiceDependency.autoLoginUseCase
        )
        self.loginView = LoginView(viewModel: loginViewModel)

        let signupViewModel = SignupViewModel(
            signupUseCase: authServiceDependency.signupUseCase
        )
        self.signupView = SignupView(viewModel: signupViewModel)

        self.onboardingView = OnboardingView()
        self.mainView = MainView()
    }

    @ViewBuilder func makeBody(for screen: OnboardingRoute) -> some View {
        switch screen {
        case .launchScreen:
            self.launchSCreenView
        case .login:
            self.loginView
        case .signup:
            self.signupView
        case .onboarding:
            self.onboardingView
        case .main:
            self.mainView
        }
    }
}
