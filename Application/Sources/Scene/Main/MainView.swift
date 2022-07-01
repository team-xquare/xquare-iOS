import SwiftUI

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
                    Text("홈")
                }
            scheduleView
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("일정")
                }
            feedView
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("피드")
                }
            applicationView
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("신청")
                }
            entireView
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("전체")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        AppDependency.resolve().mainView
    }
}
