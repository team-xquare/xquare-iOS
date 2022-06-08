import SwiftUI

import Swinject

import AuthService

@main
struct XQUAREApp: App {

    let assembler: Assembler = .init([
        AuthServiceAssembly()
    ])

    var body: some Scene {
        WindowGroup {
            EmptyView()
        }
    }

}
