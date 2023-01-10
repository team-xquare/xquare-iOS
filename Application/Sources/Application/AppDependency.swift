import Foundation

import AttachmentService
import AuthService
import MealDataService
import UserService
import ComposableArchitecture

struct AppDependency {
    let launchScreenView: LaunchScreenView
    let signupView: SignupView
}

// swiftlint:disable function_body_length
extension AppDependency {
    static func resolve() -> AppDependency {

        // MARK: - ServiceDependency
        let attachmentServiceDependency = AttachmentServiceDependency.shared
        let authServiceDependency = AuthServiceDependency.shared
        let mealDataServiceDependency = MealDataServiceDependency.shared
        let userServiceDependency = UserServiceDependency.shared

        // MARK: - ViewModels
        let homeViewModel = HomeViewModel(
            fetchMealMenuPerDayUseCase: mealDataServiceDependency.fetchDayToMealMenuUseCase,
            fetchUserPointUseCase: userServiceDependency.fetchUserSimpleInformationUseCase
        )
        let applicationViewModel = ApplicationViewModel(
            fetchAccessTokenUseCase: authServiceDependency.fetchAccessTokenUseCase
        )
        let loginViewModel = LoginViewModel(
            signInUseCase: authServiceDependency.signinUseCase,
            autoLoginUseCase: authServiceDependency.autoLoginUseCase
        )
        let signupStore = Store(
            initialState: SignupState(),
            reducer: SignupReducer.reducer,
            environment: SignupEnvironment(signupUseCase: authServiceDependency.signupUseCase)
        )
        let launchScreenViewModel = LaunchScreenViewModel(
            refreshTokenUseCase: authServiceDependency.refreshTokenUseCase
        )
        let mealDetailViewModel = MealDetailViewModel(
            fetchMealMenuPerMonthUseCase: mealDataServiceDependency.fetchMonthToMealMenuUseCase
        )
        let myPageViewModel = MyPageViewModel(
            fetchProfileUseCase: userServiceDependency.fetchProfileUseCase,
            editProfileImageUseCase: userServiceDependency.editProfileImageUseCase,
            uploadImageUseCase: attachmentServiceDependency.uploadImageUseCase
        )

        // MARK: - Views
        let pointHistoryView = PointHistoryView()
        let mealDetailView = MealDetailView(viewModel: mealDetailViewModel)
        let homeView = HomeView(
            viewModel: homeViewModel,
            mealDetailView: mealDetailView
        )
        let scheduleView = ScheduleView()
        let feedView = FeedView()
        let applicationView = ApplicationView(viewModel: applicationViewModel)
        let myPageView = MyPageView(
            viewModel: myPageViewModel
        )
        let entireView = EntireView(
            pointHistoryView: pointHistoryView,
            myPageView: myPageView
        )
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
            store: signupStore,
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
            launchScreenView: launchScreenView,
            signupView: signupView
        )

    }
}
