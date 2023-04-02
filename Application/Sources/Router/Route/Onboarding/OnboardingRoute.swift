import Foundation

enum OnboardingRoute: ScreenProtocol {
    case launchScreen
    case login
    case signup
    case onboarding
    case main

    var embedInNavigationView: Bool {
        return false
    }
}
