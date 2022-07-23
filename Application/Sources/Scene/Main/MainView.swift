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
                    Image(systemName: "square.fill")
                    Text("홈").sdText(type: .caption)
                }
            scheduleView
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("일정").sdText(type: .caption)
                }
            feedView
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("피드").sdText(type: .caption)
                }
            applicationView
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("신청").sdText(type: .caption)
                }
            entireView
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("전체").sdText(type: .caption)
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        AppDependency.resolve().mainView
    }
}
