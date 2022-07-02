import SwiftUI

import SemicolonDesign

struct MainView: View {
    let homeView: HomeView
    let scheduleView: ScheduleView
    let feedView: FeedView
    let applicationView: ApplicationView
    let entireView: EntireView

    var body: some View {
        TabView {
            homeView
                .tabItem {
                    Image(systemName: "clock.fill")
                    SDText("홈", type: .body3)
                }
            scheduleView
                .tabItem {
                    Image(systemName: "clock.fill")
                    SDText("일정", type: .body3)
                }
            feedView
                .tabItem {
                    Image(systemName: "clock.fill")
                    SDText("피드", type: .body3)
                }
            applicationView
                .tabItem {
                    Image(systemName: "clock.fill")
                    SDText("신청", type: .body3)
                }
            entireView
                .tabItem {
                    Image(systemName: "clock.fill")
                    SDText("전체", type: .body3)
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        AppDependency.resolve().mainView
    }
}
