import Foundation

enum EntireRoute: ScreenProtocol {
    case entire
    case myPage
    case pointHistory
    case bugReport

    var embedInNavigationView: Bool {
        return true
    }
}
