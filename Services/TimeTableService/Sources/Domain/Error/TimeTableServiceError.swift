import Foundation

public enum TimeTableServiceError: Error {
    case unauthorized
    case timeOut
    case conflict
    case tooManyRequests
}
