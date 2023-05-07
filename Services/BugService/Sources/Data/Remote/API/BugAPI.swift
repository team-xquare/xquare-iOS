import Foundation

import AuthService
import Moya
import RestApiModule

enum BugAPI {
    case postBugReport(reason: String, category: BugCategory, imageUrl: [String])
}

extension BugAPI: XquareAPI {
    var domain: String {
        return "/reports"
    }

    var urlPath: String {
        return "/report"
    }

    var method: Moya.Method {
        return .post
    }

    var errorMapper: [Int: Error]? {
        return [
            400: BugServiceError.badRequest,
            401: BugServiceError.unauthorized,
            403: BugServiceError.forbidden,
            404: BugServiceError.notFound,
            407: BugServiceError.proxyAuthenticationRequired,
            408: BugServiceError.requestTimeout,
            409: BugServiceError.conflict,
            429: BugServiceError.tooManyRequests,
            500: BugServiceError.internalServerError
        ]
    }

    var task: Task {
        switch self {
        case .postBugReport(let reason, let category, let imageUrl):
            return .requestParameters(
                parameters: [
                    "reason": reason,
                    "category": category.rawValue,
                    "image_urls": imageUrl
                ],
                encoding: JSONEncoding.default
            )
        }
    }

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }

}
