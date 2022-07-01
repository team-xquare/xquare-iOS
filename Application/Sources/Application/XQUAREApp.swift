import SwiftUI

import Swinject

import AuthService

@main
struct XQUAREApp: App {
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
