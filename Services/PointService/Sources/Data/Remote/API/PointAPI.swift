import Foundation

import AuthService
import Moya
import RestApiModule

enum PointAPI {
    case fetchPointHistory(type: Bool?)
}

extension PointAPI: XquareAPI {

    var domain: String {
        return "/points"
    }

    var urlPath: String {
        return "/history"
    }

    var task: Task {
        switch self {
        case .fetchPointHistory(let type):
            return .requestParameters(
                parameters: [
                    "type": type as Any
                ],
                encoding: URLEncoding.default
            )
        }
    }

    var errorMapper: [Int: Error]? {
        return [
            401: PointServiceError.unauthorized,
            408: PointServiceError.timeOut,
            409: PointServiceError.conflict,
            429: PointServiceError.tooManyRequests
        ]
    }

    var method: Moya.Method {
        return .get
    }

    var jwtTokenType: AuthService.JWTTokenType {
        return .accessToken
    }

}
