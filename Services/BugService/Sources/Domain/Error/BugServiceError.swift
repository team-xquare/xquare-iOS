import Foundation

public enum BugServiceError: Error {
    case badRequest
    case unauthorized
    case notFound
    case forbidden
    case conflict
    case proxyAuthenticationRequired
    case requestTimeout
    case tooManyRequests
    case internalServerError
}

public extension Error {
    var asBugServiceError: BugServiceError? {
        self as? BugServiceError
    }
}
