import Foundation

import Moya
import AuthService

public protocol XquareAPI: TargetType, JWTTokenAuthorizable {
    var domain: String { get }
    var urlPath: String { get }
    var errorMapper: [Int: Error]? { get }
}

extension XquareAPI {

    public var baseURL: URL { URL(string: "https://api.xquare.app")! }

    public var path: String {
        return domain+urlPath
    }

    public var task: Task { .requestPlain }

    public var validationType: ValidationType {
        return .successCodes
    }

    public var headers: [String: String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }

}
