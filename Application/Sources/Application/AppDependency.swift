import Foundation

import AuthService
import MealDataService

struct AppDependency {
    let launchScreenView: LaunchScreenView
}

// swiftlint:disable function_body_length
extension AppDependency {
    static func resolve() -> AppDependency {

        // MARK: - ServiceDependency
        let authServiceDependency = AuthServiceDependency.shared
        let mealDataServiceDependency = MealDataServiceDependency.shared

        // MARK: - ViewModels
        let homeViewModel = HomeViewModel(
            fetchMealMenuPerDayUseCase: mealDataServiceDependency.fetchDayToMealMenuUseCase
        )
        let applicationViewModel = ApplicationViewModel(
            fetchAccessTokenUseCase: authServiceDependency.fetchAccessTokenUseCase
        )
        let loginViewModel = LoginViewModel(
            signInUseCase: authServiceDependency.signinUseCase
        )
        let signupViewModel = SignupViewModel(
            signupUseCase: authServiceDependency.signupUseCase
        )
        let launchScreenViewModel = LaunchScreenViewModel(
            refreshTokenUseCase: authServiceDependency.refreshTokenUseCase
        )
        let mealDetailViewModel = MealDetailViewModel()

        // MARK: - Views
        let mealDetailView = MealDetailView(viewModel: mealDetailViewModel)
        let homeView = HomeView(
            viewModel: homeViewModel,
            mealDetailView: mealDetailView
        )
        let scheduleView = ScheduleView()
        let feedView = FeedView()
        let applicationView = ApplicationView(viewModel: applicationViewModel)
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
        let signupView = SignupView(
            viewModel: signupViewModel,
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
