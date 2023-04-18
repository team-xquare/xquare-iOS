import Foundation

public enum PickServiceError: Error {
    case badRequest
    case unauthorized
    case notFound
    case forbidden
    case conflict
}

public extension Error {
    var asPickServiceError: PickServiceError? {
        self as? PickServiceError
    }
}
