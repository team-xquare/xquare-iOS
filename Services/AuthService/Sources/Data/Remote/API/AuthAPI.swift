import Foundation

import Moya
import XEnvironment

enum AuthAPI: TargetType {
    case signin(request: SigninRequest)
    case signup(request: SignupRequest)
    case logout(accessToken: String)
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
        case .signup, .logout:
            return "/users"
        }
    }

    var method: Moya.Method {
        switch self {
        case .signin, .signup:
            return .post
        case .refreshToken, .logout:
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
        case .logout(let accessToken):
            return ["Authorization": "Bearer \(accessToken)"]
        default:
            return nil
        }
    }

}
