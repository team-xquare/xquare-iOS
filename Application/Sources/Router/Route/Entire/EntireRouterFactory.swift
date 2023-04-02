import SwiftUI

import AttachmentService
import UserService
import PointService

class EntireRouterFactory: RouterFactory {
    let entireView: EntireView
    let pointHistoryView: PointHistoryView
    let myPageView: MyPageView
    let bugReportView: BugReportView

    init() {
        let attachmentServiceDependency = AttachmentServiceDependency.shared
        let userServiceDependency = UserServiceDependency.shared
        let pointServiceDependency = PointServiceDependency.shared

        self.entireView = EntireView()

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
    }

    @ViewBuilder func makeBody(for screen: EntireRoute) -> some View {
        switch screen {
        case .entire:
            self.entireView
        case .pointHistory:
            self.pointHistoryView
        case .myPage:
            self.myPageView
        case .bugReport:
            self.bugReportView
        }
    }
}
