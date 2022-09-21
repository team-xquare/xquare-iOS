import Foundation

import Moya
import XEnvironment

enum AuthAPI: TargetType {
    case signin(request: SigninRequest)
    case signup(request: SignupRequest)
    case refreshToken(refreshToken: String)
}

extension AuthAPI {

    var baseURL: URL {
        return URL(string: XEnvironment.getValue(key: .apiBaseUrl)!)!
    }

    var path: String {
        switch self {
        case .signin, .refreshToken:
            return "/users/login"
        case .signup:
            return "/users"
        }
    }

    var method: Moya.Method {
        switch self {
        case .signin, .signup:
            return .post
        case .refreshToken:
            return .put
        }
    }

    var task: Task {
        switch self {
        case .signin(let request):
            return .requestJSONEncodable(request)
        case .signup(let request):
            return .requestJSONEncodable(request)
        default:
            return .requestPlain
        }
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        switch self {
        case .refreshToken(let refreshToken):
            return ["Refresh-Token": "Bearer \(refreshToken)"]
        default:
            return nil
        }
    }

}
