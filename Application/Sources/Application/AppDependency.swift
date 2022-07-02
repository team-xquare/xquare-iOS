import Foundation

struct AppDependency {
    let mainView: MainView
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let homeView = HomeView()
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
