import SwiftUI

import SemicolonDesign
import XNavigationAndTab

struct MainView: View {
    @EnvironmentObject var homeRouter: HomeRouter
    @EnvironmentObject var scheduleRouter: ScheduleRouter
    @EnvironmentObject var feedRouter: FeedRouter
    @EnvironmentObject var applicationRouter: ApplicationRouter
    @EnvironmentObject var entireRouter: EntireRouter

    var body: some View {
        XNavigationAndTabView {(
            homeRouter.start(),
            scheduleRouter.start(),
            feedRouter.start(),
            applicationRouter.start(),
            entireRouter.start()
        )}
    }
}
