import Foundation

import AuthService
import Moya
import RestApiModule

enum PickAPI {
    case fetchOutingReturnTime
    case fetchMovedClass
    case fetchOutingPass
    case deleteReturnClass
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

    var task: Task {
        return .requestPlain
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
