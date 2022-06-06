import Foundation

public enum AuthServiceError: Error {
    case noToken
    case tokenExpired
    case failToSignin
    case duplicateId
}
