import Foundation

import AuthService
import Moya
import RestApiModule

enum PickAPI {
    case fetchOutingReturnTime
    case fetchMovedClass
    case fetchOutingPass
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
        }
    }

    var errorMapper: [Int: Error]? {
        return [
            400: PickServiceError.badRequest,
            401: PickServiceError.unauthorized,
            404: PickServiceError.notFound
        ]
    }

    var method: Moya.Method {
        return .get
    }

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }

}
