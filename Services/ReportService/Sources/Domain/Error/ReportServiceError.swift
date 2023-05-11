import Foundation

public enum ReportServiceError: Error {
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
    var asReportServiceError: ReportServiceError? {
        self as? ReportServiceError
    }
}
