import SwiftUI

import SemicolonDesign
import XNavigationAndTab

struct MainView: View {
    @EnvironmentObject var xquareRouter: XquareRouter
    let homeView: HomeView
    let scheduleView: ScheduleView
    let feedView: FeedView
    let applicationView: ApplicationView
    let entireView: EntireView

    var body: some View {
        XNavigationAndTabView(selection: $xquareRouter.tabBarSelection) {(
            homeView,
            scheduleView,
            feedView,
            applicationView,
            entireView
        )}
        .onAppear {
            xquareRouter.moveTabTo(index: 0)
        }
    }
}
