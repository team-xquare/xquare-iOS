import Foundation

import Moya
import AuthService

public protocol XquareAPI: TargetType, JWTTokenAuthorizable {
    var domain: String { get }
    var urlPath: String { get }
    var errorMapper: [Int: Error]? { get }
}

extension XquareAPI {

    var baseURL: URL { URL(string: "https://api.xquare.app")! }

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
