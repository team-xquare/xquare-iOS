import SwiftUI

import SemicolonDesign
import XNavigationAndTab
import NotificationService

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
            if xquareRouter.stack.count > 2 {
                xquareRouter.dismissLast()
            }
            guard let threadIdentifier = NotificationTopic(
                rawValue: (($0.userInfo!["threadIdentifier"] as? String)!)
            ), let index = topicToPage(topic: threadIdentifier).0 else { return }
            self.xquareRouter.moveTabTo(index: index)
            if let page = topicToPage(topic: threadIdentifier).1 {
                self.xquareRouter.navigateTo(page)
            }
        })
        .onReceive(backgroundNotification, perform: { _ in
            if xquareRouter.stack.count > 2 {
                xquareRouter.dismissLast()
            }
            let userDefault = UserDefaults.standard
            guard let threadIdentifier = userDefault.string(forKey: "threadIdentifier"),
                  let index = topicToPage(topic: NotificationTopic(rawValue: threadIdentifier)!).0 else {
                return
            }
            xquareRouter.moveTabTo(index: index)
            if let page = topicToPage(topic: NotificationTopic(rawValue: threadIdentifier)!).1 {
                xquareRouter.navigateTo(page)
            }
            userDefault.setValue(nil, forKey: "categoryIdentifier")
            userDefault.setValue(nil, forKey: "threadIdentifier")
        })
    }
}

private func topicToPage(topic: NotificationTopic) -> (Int?, XquareRoute?) {
    switch topic {
    case .allGoodPoint, .allPenaltyLevel, .allBadPoint:
        return (0, .pointHistory)
    case .feedNoticeLike, .feedBambooLike, .feedBambooComment, .feedNoticeComment:
        return (2, nil)
    case .applicationStay, .applicationPicnicPass, .applicationWeekendMeal,
            .applicationWeekendPicnic, .applicationWeekendPicnicReservation:
        return (3, nil)
    case .applicationPicnic:
        return (0, .outingPass)
    case .applicationMoveClassRoom:
        return (0, nil)
    case .scheduleLocal, .scheduleSocial:
        NotificationCenter.default.post(
            name: NSNotification.Name("schedule"),
            object: nil,
            userInfo: ["isSchedule": false]
        )
        return (1, nil)
    default:
        return (nil, nil)
    }
}
