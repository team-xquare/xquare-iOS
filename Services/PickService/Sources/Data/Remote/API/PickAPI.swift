import Foundation

import AuthService
import Moya
import RestApiModule

enum PickAPI {
    case fetchOutingReturnTime
    case fetchMovedClass
    case fetchOutingPass
    case deleteReturnClass
    case fetchTodaySelfStudyTeacher(month: String)
}

extension PickAPI: XquareAPI {

    var domain: String {
        return "/pick"
    }

    var urlPath: String {
        switch self {
        case .fetchOutingReturnTime:
            return "/applications/return"
        case .fetchMovedClass:
            return "/class-room/location"
        case .fetchOutingPass:
            return "/applications/picnic"
        case .deleteReturnClass:
            return "/applications"
        case .fetchTodaySelfStudyTeacher:
            return "/admin/director"
        }
    }

    var errorMapper: [Int: Error]? {
        return [
            400: PickServiceError.badRequest,
            401: PickServiceError.unauthorized,
            403: PickServiceError.forbidden,
            404: PickServiceError.notFound,
            409: PickServiceError.conflict,
            500: PickServiceError.severError
        ]
    }

    var method: Moya.Method {
        switch self {
        case .deleteReturnClass:
            return .delete
        default:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .fetchTodaySelfStudyTeacher(let month):
            return .requestParameters(parameters: [
                "month": month
            ], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }

}
