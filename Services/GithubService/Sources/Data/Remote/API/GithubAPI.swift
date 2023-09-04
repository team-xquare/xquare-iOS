import Foundation

import RestApiModule
import AuthService
import Moya

enum GithubAPI {
    case registerGithubID(code: String)
    case updateGithubRanking
    case fetchMyGithubInfo
    case fetchGithubInfoList
    case checkGithubConnecting
}

extension GithubAPI: XquareAPI {
    var domain: String {
        return "/gits"
    }

    var urlPath: String {
        switch self {
        case .fetchGithubInfoList:
            return "/all"
        case .checkGithubConnecting:
            return "/exist"
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

    var task: Task {
        switch self {
        case .registerGithubID(let code):
            return .requestParameters(
                parameters: ["code": code],
                encoding: URLEncoding.queryString
            )
        default:
            return .requestPlain
        }
    }

    var method: Moya.Method {
        switch self {
        case .registerGithubID:
            return .post
        case .updateGithubRanking:
            return .patch
        case .fetchMyGithubInfo, .fetchGithubInfoList, .checkGithubConnecting:
            return .get
        }
    }

    var jwtTokenType: AuthService.JWTTokenType {
        return .accessToken
    }

}
