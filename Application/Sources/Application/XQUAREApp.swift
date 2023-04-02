import SwiftUI

@main
struct XQUAREApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let onboardingRouter = OnboardingRouter(rootScreen: .launchScreen, factory: .init())

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(onboardingRouter)
        }
    }

}
