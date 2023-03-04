import Foundation

public enum ScheduleServiceError: Error {
    case unauthorized
    case timeOut
    case conflict
    case tooManyRequests
}
