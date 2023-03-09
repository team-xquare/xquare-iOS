import Foundation

public enum ScheduleServiceError: Error {
    case unauthorized
    case isNotPersonalSchedule
    case timeOut
    case conflict
    case tooManyRequests
}

public extension Error {
    var asScheduleServiceError: ScheduleServiceError? {
        self as? ScheduleServiceError
    }
}
