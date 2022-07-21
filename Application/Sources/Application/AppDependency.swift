import Foundation
import MealDataService

struct AppDependency {
    let mainView: MainView
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let mealRepository = MealRepository.resolve()
        // MARK: - ViewModels
        let homeViewModel = HomeViewModel(
            mealRepository: mealRepository
        )

        // MARK: - Views
        let homeView = HomeView(
            viewModel: homeViewModel
        )
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

        return AppDependency(mainView: mainView)
    }
}
