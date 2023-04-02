import Foundation

enum HomeRoute: ScreenProtocol {
    case home
    case mealDetail
    case notification
    case outingPass

    var embedInNavigationView: Bool {
        return true
    }
}
