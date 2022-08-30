import SwiftUI

import SemicolonDesign
import XNavigationAndTab

struct MainView: View {
    let homeView: HomeView
    let scheduleView: ScheduleView
    let feedView: FeedView
    let applicationView: ApplicationView
    let entireView: EntireView

    var body: some View {
        XNavigationAndTabView {(
            homeView,
            scheduleView,
            feedView,
            applicationView,
            entireView
        )}
        .accentColor(.GrayScale.gray800)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        AppDependency.resolve().mainView
    }
}
