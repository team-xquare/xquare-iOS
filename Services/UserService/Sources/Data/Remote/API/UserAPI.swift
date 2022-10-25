import Foundation

import Moya
import RestApiModule
import AuthService

enum UserAPI {
    case fetchUserInformationById(userId: String)
    case fetchUserInformationByName(accountId: String)
    case fetchUserListByClass(grade: Int, classNumber: Int)
    case fetchFCMToken(users: [String])
    case fetchExcludedUserList(users: [String])
    case fetchUserPoint
}

extension UserAPI: XquareAPI {

    var domain: String {
        return "/users"
    }

    var urlPath: String {
        switch self {
        case .fetchUserInformationById(let userId):
            return "/id/\(userId)"
        case .fetchUserInformationByName(let accountId):
            return "/account-id/\(accountId)"
        case .fetchFCMToken:
            return "/device-token"
        case .fetchExcludedUserList, .fetchUserPoint:
            return "/points"
        default:
            return ""
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .fetchUserListByClass(let grade, let classNumber):
            return .requestParameters(
                parameters: [
                    "grade": grade,
                    "class": classNumber
                ], encoding: URLEncoding.queryString
            )
        case .fetchFCMToken(let users), .fetchExcludedUserList(let users):
            return .requestParameters(
                parameters: [
                    "users": users
                ], encoding: URLEncoding.queryString
            )
        default:
            return .requestPlain
        }
    }

    var errorMapper: [Int: Error]? {
        return [
            401: UserServiceError.unauthorized,
            408: UserServiceError.timeOut,
            409: UserServiceError.conflict,
            429: UserServiceError.tooManyRequests
        ]
    }

    var jwtTokenType: JWTTokenType {
        switch self {
        case .fetchFCMToken, .fetchExcludedUserList:
            return .none
        default:
            return .accessToken
        }
    }
}
