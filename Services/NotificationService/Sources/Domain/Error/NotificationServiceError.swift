import Foundation

public enum NotificationServiceError: Error {
    case unauthorized
    case timeOut
    case conflict
    case tooManyRequests
}
