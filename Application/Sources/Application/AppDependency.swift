import Foundation

import AttachmentService
import AuthService
import MealDataService
import UserService

struct AppDependency {
    let launchScreenView: LaunchScreenView
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
        let signupViewModel = SignupViewModel(
            signupUseCase: authServiceDependency.signupUseCase
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
        let bugReportViewModel = BugReportViewModel()
        let academicScheduleViewModel = AcademicScheduleViewModel()
        let writeScheduleViewModel = WriteScheduleViewModel()

        // MARK: - Views
        let pointHistoryView = PointHistoryView()
        let mealDetailView = MealDetailView(viewModel: mealDetailViewModel)
        let homeView = HomeView(
            viewModel: homeViewModel,
            mealDetailView: mealDetailView
        )
        let writeScheduleView = WriteScheduleView(viewModel: writeScheduleViewModel)
        let bugReportView = BugReportView(viewModel: bugReportViewModel)
        let timeTableView = TimeTableView()
        let academicScheduleView = AcademicScheduleView(
            viewModel: academicScheduleViewModel,
            writeScheduleView: writeScheduleView
        )
        let scheduleView = ScheduleView(
            timeTableView: timeTableView,
            academicScheduleView: academicScheduleView
        )
        let feedView = FeedView()
        let applicationView = ApplicationView(viewModel: applicationViewModel)
        let myPageView = MyPageView(
            viewModel: myPageViewModel
        )
        let entireView = EntireView(
            pointHistoryView: pointHistoryView,
            myPageView: myPageView,
            bugReportView: bugReportView
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
