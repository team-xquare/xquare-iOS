import Foundation

enum XquareRoute: ScreenProtocol {
    case launch
    case onboarding
    case main
    case login
    case signup

    // Home
    case mealDetail
    case notification
    case outingPass

    // Schedule
    case writeScheudle

    // Entire
    case myPage
    case pointHistory
    case bugReport

    var embedInNavigationView: Bool {
        switch self {
        case .launch, .onboarding, .mealDetail, .notification, .outingPass,
                .writeScheudle, .myPage, .bugReport, .pointHistory:
            return false
        default:
            return true
        }
    }

}
