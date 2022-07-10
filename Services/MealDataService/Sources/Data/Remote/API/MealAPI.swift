import Foundation

import Moya
import RestApiModule
import AuthService

enum MealAPI {
    case fetchDayToMealMenu(date: String)
    case fetchMonthToMealMenu(request: MonthToMealMenuRequest)
}

extension MealAPI: XquareAPI {
    var domain: String {
        return "/meals"
    }

    var urlPath: String {
        switch self {
        case .fetchDayToMealMenu(let date):
            return "/\(date)"
        case .fetchMonthToMealMenu:
            return ""
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .fetchMonthToMealMenu(let request):
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
