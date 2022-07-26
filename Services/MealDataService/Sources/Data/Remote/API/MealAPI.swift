import Foundation

import Moya
import RestApiModule
import AuthService

enum MealAPI {
    case fetchMealMenuPerDay(date: String)
    case fetchMealMenuPerMonth(request: MonthToMealMenuRequest)
}

extension MealAPI: XquareAPI {
    var domain: String {
        return "/meals"
    }

    var urlPath: String {
        switch self {
        case .fetchMealMenuPerDay(let date):
            return "/\(date)"
        case .fetchMealMenuPerMonth:
            return ""
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .fetchMealMenuPerMonth(let request):
            return .requestParameters(
                parameters: [
                    "yaer": request.year,
                    "month": request.month
                ], encoding: URLEncoding.queryString
            )
        default:
            return .requestPlain
        }
    }

    var errorMapper: [Int: Error]? {
        return [
            408: MealServiceError.timeOut,
            429: MealServiceError.tooManyRequests
        ]
    }

    var jwtTokenType: JWTTokenType {
        return .none
    }

}
