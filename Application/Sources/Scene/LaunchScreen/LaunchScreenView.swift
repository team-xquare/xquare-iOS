import SwiftUI

import SemicolonDesign

struct LaunchScreenView: View {

    @StateObject var viewModel: LaunchScreenViewModel
    @EnvironmentObject var onboardingRouter: OnboardingRouter

    let homeRouter = HomeRouter(rootScreen: .home, factory: .init())
    let scheduleRouter = ScheduleRouter(rootScreen: .schedule, factory: .init())
    let feedRouter = FeedRouter(rootScreen: .feed, factory: .init())
    let applicationRouter = ApplicationRouter(rootScreen: .application, factory: .init())
    let entireRouter = EntireRouter(rootScreen: .entire, factory: .init())

    var body: some View {
        ZStack {
            Color.Primary.purple400
                .ignoresSafeArea(edges: .all)
            Image.logo
                .frame(width: 250, height: 250, alignment: .center)
        }
        .onChange(of: viewModel.isSuccessToRefreshToken, perform: { isSuccess in
            if isSuccess {
                onboardingRouter.presentFullScreen(.main)
            }
        })
        .onChange(of: viewModel.isFailureToRefreshToken, perform: { isFaile in
            if isFaile {
                onboardingRouter.presentFullScreen(.onboarding)
            }
        })
        .onAppear(perform: viewModel.refreshToken)
        .onDisappear {
            viewModel.isFailureToRefreshToken = false
            viewModel.isSuccessToRefreshToken = false
        }
        .environmentObject(homeRouter)
        .environmentObject(scheduleRouter)
        .environmentObject(feedRouter)
        .environmentObject(applicationRouter)
        .environmentObject(entireRouter)
    }
}
