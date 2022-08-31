import Foundation

import AuthService
import MealDataService

struct AppDependency {
    let mainView: MainView
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let dependency = MealDataServiceDependency.resolve()
        let authDependency = AuthServiceDependency.resolve()
        // MARK: - ViewModels
        let homeViewModel = HomeViewModel(
            fetchMealMenuPerDayUseCase: dependency.fetchDayToMealMenuUseCase
        )
        let loginViewModel = LoginViewModel(
            signInUseCase: authDependency.signinUseCase
        )
        let signUpViewModel = SignUpViewModel(
            signupUseCase: authDependency.signupUseCase
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
