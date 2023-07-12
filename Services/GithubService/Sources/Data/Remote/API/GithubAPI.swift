import Foundation

import RestApiModule
import AuthService
import Moya

enum GithubAPI {
    case registerGithubID(userName: String)
    case fetchMyGithubInfo
    case fetchGithubInfoList
}

extension GithubAPI: XquareAPI {
    var domain: String {
        return "/gits"
    }

    var urlPath: String {
        switch self {
        case .fetchGithubInfoList:
            return "/all"
        default:
            return ""
        }
    }

    var errorMapper: [Int: Error]? {
        return [
            400: GithubServiceError.badRequest,
            404: GithubServiceError.notFoundUser,
            429: GithubServiceError.tooManyRequests
        ]
    }

    var method: Moya.Method {
        switch self {
        case .registerGithubID:
            return .post
        case .fetchMyGithubInfo, .fetchGithubInfoList:
            return .get
        }
    }

    var jwtTokenType: AuthService.JWTTokenType {
        return .accessToken
    }

}
