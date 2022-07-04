import Foundation

import Moya

enum MealAPI: TargetType {
    case fetchDayToMealMenu(date: String)
    case fetchMonthToMealMenu(year: String, month: String)
}

extension MealAPI {
    var baseURL: URL {
        return URL(string: "https://api.xquare.app")!
    }

    var path: String {
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
        case .fetchMonthToMealMenu(let year, let month):
            return .requestParameters(
                parameters: [
                    "year": year,
                    "month": month
                ], encoding: URLEncoding.queryString
            )
        default:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return nil
    }
}
