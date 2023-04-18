import SwiftUI

import AuthService
import AttachmentService
import UserService
import PointService
import PickService
import NotificationService
import MealDataService
import ScheduleService
import TimeTableService

class XquareRouterFactory: RouterFactory {

    // MARK: - View
    let launchScreenView: LaunchScreenView
    let onboardingView: OnboardingView
    let mainView: MainView
    let loginView: LoginView
    let signupView: SignupView

    let mealDetailView: MealDetailView
    let notificationView: NotificationView
    let outingPassView: OutingPassView

    let writeScheduleView: WriteScheduleView

    let pointHistoryView: PointHistoryView
    let myPageView: MyPageView
    let bugReportView: BugReportView
    let selfStudyTeacherView: SelfStudyTeacherView

    // swiftlint:disable function_body_length
    init() {
        let authServiceDependency = AuthServiceDependency.shared
        let attachmentServiceDependency = AttachmentServiceDependency.shared
        let userServiceDependency = UserServiceDependency.shared
        let pointServiceDependency = PointServiceDependency.shared
        let pickeServiceDependency = PickServiceDependency.shared
        let notificatoinServiceDependency = NotificationServiceDependency.shared
        let mealDataServiceDependency = MealDataServiceDependency.shared
        let scheduleServiceDependency = ScheduleServiceDependency.shared
        let timeTableServiceDependency = TimeTableServiceDependency.shared

        let launchScreenViewModel = LaunchScreenViewModel(
            refreshTokenUseCase: authServiceDependency.refreshTokenUseCase
        )
        self.launchScreenView = LaunchScreenView(viewModel: launchScreenViewModel)

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

        let homeViewModel = HomeViewModel(
            fetchMealMenuPerDayUseCase: mealDataServiceDependency.fetchDayToMealMenuUseCase,
            fetchUserPointUseCase: userServiceDependency.fetchUserSimpleInformationUseCase,
            fetchOutingReturnTimeUseCase: pickeServiceDependency.fetchOutingReturnTimeUseCase,
            fetchMovedClassUseCase: pickeServiceDependency.fetchMovedClassUseCase,
            deleteReturnClassUseCase: pickeServiceDependency.deleteReturnClassUseCase
        )
        let timeTableViewModel = TimeTableViewModel(
            fetchTimeTableForWeekUseCase: timeTableServiceDependency.fetchTimeTableForWeekUseCase
        )
        let academicScheduleViewModel = AcademicScheduleViewModel(
            fetchSchedulePerMonthUseCase: scheduleServiceDependency.fetchScheduleForMonthUseCase,
            editScheduleUseCase: scheduleServiceDependency.editScheduleUseCase,
            deleteScheduleUseCase: scheduleServiceDependency.deleteScheduleUseCase
        )
        let feedViewModel = FeedViewModel(
            fetchAccessTokenUseCase: authServiceDependency.fetchAccessTokenUseCase,
            refreshTokenIfExpiredUseCase: authServiceDependency.refreshTokenIfExpiredUseCase
        )
        let applicationViewModel = ApplicationViewModel(
            fetchAccessTokenUseCase: authServiceDependency.fetchAccessTokenUseCase,
            refreshTokenIfExpiredUseCase: authServiceDependency.refreshTokenIfExpiredUseCase
        )
        let entireViewModel = EntireViewModel(
            logoutUseCase: authServiceDependency.logoutUseCase
        )

        self.mainView = MainView(
            homeView: .init(viewModel: homeViewModel),
            scheduleView: .init(
                timeTableView: .init(viewModel: timeTableViewModel),
                academicScheduleView: .init(viewModel: academicScheduleViewModel)
            ),
            feedView: .init(viewModel: feedViewModel),
            applicationView: .init(viewModel: applicationViewModel),
            entireView: .init(viewModel: entireViewModel)
        )

        let mealDetailViewModel = MealDetailViewModel(
            fetchMealMenuPerMonthUseCase: mealDataServiceDependency.fetchMonthToMealMenuUseCase
        )
        self.mealDetailView = MealDetailView(viewModel: mealDetailViewModel)

        let notificationViewModel = NotificationViewModel(
            fetchPostedNotificationListUseCase: notificatoinServiceDependency.fetchPostedNotificationListUseCase
        )
        self.notificationView = NotificationView(viewModel: notificationViewModel)

        let outingPassViewModel = OutingPassViewModel(
            fetchOutingPassUseCase: pickeServiceDependency.fetchOutingPassUseCase
        )
        self.outingPassView = OutingPassView(viewModel: outingPassViewModel)

        let pointHistoryViewModel = PointHistoryViewModel(
            fetchPointHistoryUseCase: pointServiceDependency.fetchPointHistoryUseCase
        )
        self.pointHistoryView = PointHistoryView(viewModel: pointHistoryViewModel)

        let myPageViewModel = MyPageViewModel(
            fetchProfileUseCase: userServiceDependency.fetchProfileUseCase,
            editProfileImageUseCase: userServiceDependency.editProfileImageUseCase,
            uploadImageUseCase: attachmentServiceDependency.uploadImageUseCase
        )
        self.myPageView = MyPageView(viewModel: myPageViewModel)

        let bugReportViewModel = BugReportViewModel()

        self.bugReportView = BugReportView(viewModel: bugReportViewModel)

        let writeScheduleViewModel = WriteScheduleViewModel(
            createScheduleUseCase: scheduleServiceDependency.createScheduleUseCase
        )
        self.writeScheduleView = WriteScheduleView(viewModel: writeScheduleViewModel)
        let selfStudyTeacherViewModel = SelfStudyTeacherViewModel(
            fetchTodaySelfStudyTeacherUseCase: pickeServiceDependency.fetchTodaySelfStudyTeacherUseCase
        )
        self.selfStudyTeacherView = SelfStudyTeacherView(viewModel: selfStudyTeacherViewModel)
    }
    // swiftlint:enable function_body_length

    // swiftlint:disable cyclomatic_complexity
    @ViewBuilder func makeBody(for screen: XquareRoute) -> some View {
        switch screen {
        case .launch:
            launchScreenView
        case .onboarding:
            onboardingView
        case .login:
            loginView
        case .signup:
            signupView
        case .main:
            mainView
        case .mealDetail:
            mealDetailView
        case .notification:
            notificationView
        case .outingPass:
            outingPassView
        case .writeScheudle:
            writeScheduleView
        case .pointHistory:
            pointHistoryView
        case .myPage:
            myPageView
        case .bugReport:
            bugReportView
        case .selfStudyTeacher:
            selfStudyTeacherView
        }
    }
    // swiftlint:enable cyclomatic_complexity
}
