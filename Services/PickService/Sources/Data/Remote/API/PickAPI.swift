import Foundation

import AuthService
import Moya
import RestApiModule

enum PickAPI {
    case fetchOutingReturnTime
    case fetchMovedClass
    case fetchOutingPass
    case deleteReturnClass
    case fetchTodaySelfStudyTeacher
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
            return "/self-study/today"
        }
    }

    var errorMapper: [Int: Error]? {
        return [
            400: PickServiceError.badRequest,
            401: PickServiceError.unauthorized,
            403: PickServiceError.forbidden,
            404: PickServiceError.notFound,
            409: PickServiceError.conflict
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

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }

}
