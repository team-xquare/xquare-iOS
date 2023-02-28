import Foundation

public enum PointServiceError: Error {
    case unauthorized
    case timeOut
    case conflict
    case tooManyRequests
}
