import Foundation

public enum GithubServiceError: Error {
    case badRequest
    case notFoundUser
    case tooManyRequests
}
