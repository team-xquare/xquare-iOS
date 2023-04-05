import SwiftUI

struct ContentView: View {
    @EnvironmentObject var xquareRouter: XquareRouter

    var body: some View {
        xquareRouter.start()
    }
}
