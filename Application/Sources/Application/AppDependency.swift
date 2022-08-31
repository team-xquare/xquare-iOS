import Foundation

import AuthService
import MealDataService

struct AppDependency {
    let mainView: MainView
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let mealDataServiceDependency = MealDataServiceDependency.resolve()
        let authServiceDependency = AuthServiceDependency.resolve()
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
        _ = SignUpView(
            viewModel: signUpViewModel,
            loginView: loginView
        )

        return AppDependency(
            mainView: mainView
        )

    }
}
