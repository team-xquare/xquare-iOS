import Foundation

import AuthService
import Moya
import RestApiModule

enum ScheduleAPI {
    case fetchScheduleForMonth(month: Int)
    case createSchedule(name: String, date: String)
    case editSchedule(scheduleId: String, name: String, date: String)
    case deleteSchedule(scheduelId: String)
}

extension ScheduleAPI: XquareAPI {

    var domain: String {
        return "/schedules"
    }

    var urlPath: String {
        switch self {
        case .fetchScheduleForMonth:
            return "/school"
        case .editSchedule(let scheduleId, _, _), .deleteSchedule(let scheduleId):
            return "/mine/\(scheduleId)"
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
        case .createSchedule(let name, let date), .editSchedule(_, let name, let date):
            return .requestParameters(
                parameters: [
                    "name": name,
                    "date": date
                ],
                encoding: JSONEncoding.default
            )
        default:
            return .requestPlain
        }
    }

    var errorMapper: [Int: Error]? {
        return [
            401: ScheduleServiceError.unauthorized,
            404: ScheduleServiceError.isNotPersonalSchedule,
            408: ScheduleServiceError.timeOut,
            409: ScheduleServiceError.conflict,
            429: ScheduleServiceError.tooManyRequests
        ]
    }

    var method: Moya.Method {
        switch self {
        case .fetchScheduleForMonth:
            return .get
        case .editSchedule:
            return .put
        case .deleteSchedule:
            return .delete
        default:
            return .post
        }
    }

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }

}
