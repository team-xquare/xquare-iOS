import SwiftUI

import MealDataService
import UserService
import NotificationService
import PickService

class HomeRouterFactory: RouterFactory {

    let homeView: HomeView
    let mealDetailView: MealDetailView
    let notificationView: NotificationView
    let outingPassView: OutingPassView

    init() {
        let mealDataServiceDependency = MealDataServiceDependency.shared
        let userServiceDependency = UserServiceDependency.shared
        let pickeServiceDependency = PickServiceDependency.shared
        let notificatoinServiceDependency = NotificationServiceDependency.shared

        let homeViewModel = HomeViewModel(
            fetchMealMenuPerDayUseCase: mealDataServiceDependency.fetchDayToMealMenuUseCase,
            fetchUserPointUseCase: userServiceDependency.fetchUserSimpleInformationUseCase,
            fetchOutingReturnTimeUseCase: pickeServiceDependency.fetchOutingReturnTimeUseCase,
            fetchMovedClassUseCase: pickeServiceDependency.fetchMovedClassUseCase,
            deleteReturnClassUseCase: pickeServiceDependency.deleteReturnClassUseCase
        )
        self.homeView = HomeView(viewModel: homeViewModel)

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
    }

    @ViewBuilder func makeBody(for screen: HomeRoute) -> some View {
        switch screen {
        case .home:
            self.homeView
        case .mealDetail:
            self.mealDetailView
        case .notification:
            self.notificationView
        case .outingPass:
            self.outingPassView
        }
    }
}
