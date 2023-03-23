import Foundation

import AttachmentService
import AuthService
import MealDataService
import ScheduleService
import TimeTableService
import PointService
import UserService
import PickService
import NotificationService

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
        let scheduleServiceSependency = ScheduleServiceDependency.shared
        let timeTableServiceDependency = TimeTableServiceDependency.shared
        let userServiceDependency = UserServiceDependency.shared
        let pointServiceDependency = PointServiceDependency.shared
        let pickServiceDependency = PickServiceDependency.shared
        let notificationServiceDependency = NotificationServiceDependency.shared

        // MARK: - ViewModels
        let homeViewModel = HomeViewModel(
            fetchMealMenuPerDayUseCase: mealDataServiceDependency.fetchDayToMealMenuUseCase,
            fetchUserPointUseCase: userServiceDependency.fetchUserSimpleInformationUseCase,
            fetchOutingReturnTimeUseCase: pickServiceDependency.fetchOutingReturnTimeUseCase,
            fetchMovedClassUseCase: pickServiceDependency.fetchMovedClassUseCase,
            deleteReturnClassUseCase: pickServiceDependency.deleteReturnClassUseCase
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
        let outingPassViewModel = OutingPassViewModel(
            fetchOutingPassUseCase: pickServiceDependency.fetchOutingPassUseCase
        )
        let myPageViewModel = MyPageViewModel(
            fetchProfileUseCase: userServiceDependency.fetchProfileUseCase,
            editProfileImageUseCase: userServiceDependency.editProfileImageUseCase,
            uploadImageUseCase: attachmentServiceDependency.uploadImageUseCase
        )
        let feedViewModel = FeedViewModel(
            fetchAccessTokenUseCase: authServiceDependency.fetchAccessTokenUseCase
            )
        let bugReportViewModel = BugReportViewModel()
        let academicScheduleViewModel = AcademicScheduleViewModel(
            fetchSchedulePerMonthUseCase: scheduleServiceSependency.fetchScheduleForMonthUseCase,
            editScheduleUseCase: scheduleServiceSependency.editScheduleUseCase,
            deleteScheduleUseCase: scheduleServiceSependency.deleteScheduleUseCase
        )
        let writeScheduleViewModel = WriteScheduleViewModel(
            createScheduleUseCase: scheduleServiceSependency.createScheduleUseCase
        )
        let timeTableViewModel = TimeTableViewModel(
            fetchTimeTableForWeekUseCase: timeTableServiceDependency.fetchTimeTableForWeekUseCase
        )
        let pointHistoryViewModel = PointHistoryViewModel(
            fetchPointHistoryUseCase: pointServiceDependency.fetchPointHistoryUseCase
        )
        let notificationViewModel = NotificationViewModel(
            fetchPostedNotificationListUseCase: notificationServiceDependency.fetchPostedNotificationListUseCase
        )

        // MARK: - Views
        let pointHistoryView = PointHistoryView(
            viewModel: pointHistoryViewModel
        )
        let mealDetailView = MealDetailView(viewModel: mealDetailViewModel)
        let notificationView = NotificationView()
        let outingPassView = OutingPassView(viewModel: outingPassViewModel)
        let notificationView = NotificationView(viewModel: notificationViewModel)
        let homeView = HomeView(
            viewModel: homeViewModel,
            mealDetailView: mealDetailView,
            notificationView: notificationView,
            outingPassView: outingPassView
        )
        let feedView = FeedView(viewModel: feedViewModel)
        let writeScheduleView = WriteScheduleView(viewModel: writeScheduleViewModel)
        let bugReportView = BugReportView(viewModel: bugReportViewModel)
        let timeTableView = TimeTableView(viewModel: timeTableViewModel)
        let academicScheduleView = AcademicScheduleView(
            viewModel: academicScheduleViewModel,
            writeScheduleView: writeScheduleView
        )
        let scheduleView = ScheduleView(
            timeTableView: timeTableView,
            academicScheduleView: academicScheduleView
        )
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
