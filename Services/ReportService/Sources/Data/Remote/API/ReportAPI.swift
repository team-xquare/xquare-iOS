import Foundation

import AuthService
import Moya
import RestApiModule

enum ReportAPI {
    case postBugReport(reason: String, category: BugCategory, imageUrl: [String])
    case fetchReleaseNote
}

extension ReportAPI: XquareAPI {
    var domain: String {
        return "/reports"
    }

    var urlPath: String {
        switch self {
        case .postBugReport:
            return "/report"
        case .fetchReleaseNote:
            return "/note/list"
        }
    }

    var method: Moya.Method {
        switch self {
        case .postBugReport:
            return .post
        case .fetchReleaseNote:
            return .get
        }
    }

    var errorMapper: [Int: Error]? {
        return [
            400: ReportServiceError.badRequest,
            401: ReportServiceError.unauthorized,
            403: ReportServiceError.forbidden,
            404: ReportServiceError.notFound,
            407: ReportServiceError.proxyAuthenticationRequired,
            408: ReportServiceError.requestTimeout,
            409: ReportServiceError.conflict,
            429: ReportServiceError.tooManyRequests,
            500: ReportServiceError.internalServerError
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
        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }

}
