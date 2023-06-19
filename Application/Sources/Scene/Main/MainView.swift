import SwiftUI

import SemicolonDesign
import XNavigationAndTab

struct MainView: View {
    @EnvironmentObject var xquareRouter: XquareRouter
    let activeNotification = NotificationCenter.default.publisher(
        for: NSNotification.Name("touchNotification")
    )
    let backgroundNotification = NotificationCenter.default.publisher(
        for: NSNotification.Name(UIApplication.didBecomeActiveNotification.rawValue)
    )
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
        .onReceive(activeNotification, perform: {
            let threadIdentifier: String = ($0.userInfo!["threadIdentifier"] as? String ?? "threadIdentifier")
            if let index = threadIdentifier.stringToPage().0 {
                self.xquareRouter.moveTabTo(index: index)
                if let page: XquareRoute = threadIdentifier.stringToPage().1 {
                    self.xquareRouter.navigateTo(page)
                } else { return }
            } else { return }
        })
        .onReceive(backgroundNotification, perform: { _ in
            let userDefault = UserDefaults.standard
            if let threadIdentifier: String = userDefault.string(forKey: "threadIdentifier") {
                print("Back")
                if let index = threadIdentifier.stringToPage().0 {
                    self.xquareRouter.moveTabTo(index: index)
                    if let page: XquareRoute = threadIdentifier.stringToPage().1 {
                        self.xquareRouter.navigateTo(page)
                    } else { return }
                } else { return }
            } else { return }
            userDefault.setValue(nil, forKey: "threadIdentifier")
        })
    }
}
