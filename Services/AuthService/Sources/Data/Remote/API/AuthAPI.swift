import Foundation

import Moya

enum AuthAPI: TargetType {
    case signin(request: SigninRequest)
    case signup(request: SignupRequest)
    case refreshToken(refreshToken: String)
}

extension AuthAPI {
    var baseURL: URL {
        return URL(string: "https://api.xquare.app")!
    }

    var path: String {
        switch self {
        case .signin, .refreshToken:
            return "/login"
        case .signup:
            return ""
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

    var headers: [String: String]? {
        switch self {
        case .refreshToken(let refreshToken):
            return ["Refresh-Token": "Bearer \(refreshToken)"]
        default:
            return nil
        }
    }

}
