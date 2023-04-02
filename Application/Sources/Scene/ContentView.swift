import SwiftUI

struct ContentView: View {
    @EnvironmentObject var onboardingRouter: OnboardingRouter

    var body: some View {
        onboardingRouter.start()
    }
}
