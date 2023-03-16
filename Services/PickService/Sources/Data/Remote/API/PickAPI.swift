import Foundation

import AuthService
import Moya
import RestApiModule

enum PickAPI {
    case fetchOutingReturnTime
    case fetchMovedClass
    case fetchOutingPass
    case deleteReturnClass(period: Int)
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
            return "/applications/"
        }
    }

    var errorMapper: [Int: Error]? {
        return [
            400: PickServiceError.badRequest,
            401: PickServiceError.unauthorized,
            404: PickServiceError.notFound
        ]
    }

    var task: Task {
        switch self {
        case .deleteReturnClass(let period):
            return .requestParameters(parameters: [
                "period": period
            ], encoding: JSONEncoding.default)
        default:
            return .requestPlain
        }
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
