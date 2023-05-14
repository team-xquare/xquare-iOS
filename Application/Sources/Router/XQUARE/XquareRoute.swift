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
    case selfStudyTeacher
    case releaseNote

    var embedInNavigationView: Bool {
        switch self {
        case .launch, .mealDetail, .notification, .outingPass, .login, .signup,
                .writeScheudle, .myPage, .bugReport, .pointHistory, .selfStudyTeacher, .releaseNote:
            return false
        default:
            return true
        }
    }

}
