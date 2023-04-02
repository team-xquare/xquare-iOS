import Foundation

enum ScheduleRoute: ScreenProtocol {
    case schedule
    case writeSchedule

    var embedInNavigationView: Bool {
        return true
    }
}
