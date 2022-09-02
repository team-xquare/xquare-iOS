import Foundation

import AuthService
import MealDataService

struct AppDependency {
    let launchScreenView: LaunchScreenView
}

extension AppDependency {
    static func resolve() -> AppDependency {

        // MARK: - ServiceDependency
        let authServiceDependency = AuthServiceDependency.resolve()
        let mealDataServiceDependency = MealDataServiceDependency.resolve()

        // MARK: - ViewModels
        let homeViewModel = HomeViewModel(
            fetchMealMenuPerDayUseCase: mealDataServiceDependency.fetchDayToMealMenuUseCase
        )
        let loginViewModel = LoginViewModel(
            signInUseCase: authServiceDependency.signinUseCase
        )
        let signUpViewModel = SignUpViewModel(
            signupUseCase: authServiceDependency.signupUseCase
        )
        let launchScreenViewModel = LaunchScreenViewModel(
            refreshTokenUseCase: authServiceDependency.refreshTokenUseCase
        )

        // MARK: - Views
        let homeView = HomeView(viewModel: homeViewModel)
        let scheduleView = ScheduleView()
        let feedView = FeedView()
        let applicationView = ApplicationView()
        let entireView = EntireView()
        let mainView = MainView(
            homeView: homeView,
            scheduleView: scheduleView,
            feedView: feedView,
            applicationView: applicationView,
            entireView: entireView
        )
        let loginView = LoginView(
            viewModel: loginViewModel,
            mainView: mainView
        )
        let signupView = SignUpView(
            viewModel: signUpViewModel,
            loginView: loginView
        )
        let onboardingView = OnboardingView(
            signupView: signupView,
            loginView: loginView
        )
        let launchScreenView = LaunchScreenView(
            viewModel: launchScreenViewModel,
            onboardingView: onboardingView,
            mainView: mainView
        )

        return AppDependency(
            launchScreenView: launchScreenView
        )

    }
}
