import SwiftUI

@main
struct XQUAREApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let xquareRouter = XquareRouter(rootScreen: .launch, factory: .init())

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(xquareRouter)
        }
    }

}
