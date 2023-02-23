import Foundation

import AuthService
import Moya
import RestApiModule

enum ScheduleAPI {
    case fetchScheduleForMonth(month: Int)
    case createSchedule(name: String, date: String)
}

extension ScheduleAPI: XquareAPI {

    var domain: String {
        return "/schedules"
    }

    var urlPath: String {
        switch self {
        case .fetchScheduleForMonth:
            return "/school"
        default:
            return "/mine"
        }
    }

    var task: Task {
        switch self {
        case .fetchScheduleForMonth(let month):
            return .requestParameters(
                parameters: [
                    "month": month
                ],
                encoding: URLEncoding.default
            )
        case .createSchedule(let name, let date):
            return .requestParameters(
                parameters: [
                    "name": name,
                    "date": date
                ],
                encoding: JSONEncoding.default
            )
        }
    }

    var errorMapper: [Int: Error]? {
        return [
            401: ScheduleServiceError.unauthorized,
            408: ScheduleServiceError.timeOut,
            409: ScheduleServiceError.conflict,
            429: ScheduleServiceError.tooManyRequests
        ]
    }

    var method: Moya.Method {
        switch self {
        case .fetchScheduleForMonth:
            return .get
        default:
            return .post
        }
    }

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }

}
