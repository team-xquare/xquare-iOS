import Foundation

import AuthService
import MealDataService

struct AppDependency {
    let mainView: MainView
    let signupView: SignUpView
    let loginView: LoginView
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let dependency = MealDataServiceDependency.resolve()
        let authDependency = AuthServiceDependency.resolve()
        // MARK: - ViewModels
        let homeViewModel = HomeViewModel(
            fetchMealMenuPerDayUseCase: dependency.fetchDayToMealMenuUseCase
        )
        let signupViewModel = SignUpViewModel(
            signupUseCase: authDependency.signupUseCase
        )
        let loginViewModel = LoginViewModel()

        // MARK: - Views
        let homeView = HomeView(
            viewModel: homeViewModel
        )
        let scheduleView = ScheduleView()
        let feedView = FeedView()
        let applicationView = ApplicationView()
        let entireView = EntireView()
        let signupView = SignUpView(
            viewModel: signupViewModel
        )
        let loginView = LoginView(viewModel: loginViewModel)

        let mainView = MainView(
            homeView: homeView,
            scheduleView: scheduleView,
            feedView: feedView,
            applicationView: applicationView,
            entireView: entireView
        )

        return AppDependency(
            mainView: mainView,
            signupView: signupView,
            loginView: loginView
        )
    }
}
