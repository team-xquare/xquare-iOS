import Foundation

public enum UserServiceError: Error {
    case unauthorized
    case timeOut
    case conflict
    case tooManyRequests
}
