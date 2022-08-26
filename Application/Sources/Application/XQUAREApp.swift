import SwiftUI

import AuthService

@main
struct XQUAREApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    let dependency: AppDependency

    init() {
        self.dependency = AppDependency.resolve()
    }

    var body: some Scene {
        WindowGroup {
            dependency.mainView
        }
    }

}
