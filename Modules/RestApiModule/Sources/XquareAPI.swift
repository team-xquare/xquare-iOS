import Foundation

import Moya
import AuthService
import XEnvironment

public protocol XquareAPI: TargetType, JWTTokenAuthorizable {
    var domain: String { get }
    var urlPath: String { get }
    var errorMapper: [Int: Error]? { get }
}

public extension XquareAPI {

    var baseURL: URL {
        return URL(string: XEnvironment.getValue(key: .apiBaseUrl)!)!
    }

    var path: String {
        return domain+urlPath
    }

    var task: Task { .requestPlain }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }

}
