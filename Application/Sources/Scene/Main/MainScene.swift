import SwiftUI

struct MainScene: View {
    var body: some View {
        TabView {
            HomeScene()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("홈")
                }
            ScheduleScene()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("일정")
                }
            FeedScene()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("피드")
                }
            ApplicationScene()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("신청")
                }
            EntireScene()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("전체")
                }
        }
    }
}

struct MainScene_Previews: PreviewProvider {
    static var previews: some View {
        MainScene()
    }
}
