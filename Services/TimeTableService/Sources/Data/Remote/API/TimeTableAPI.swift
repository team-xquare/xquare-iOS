import Foundation

import AuthService
import Moya
import RestApiModule

enum TimeTableAPI {
    case fetchTimeTableForWeek
}

extension TimeTableAPI: XquareAPI {

    var domain: String {
        return "/timetables"
    }

    var urlPath: String {
        return "/week"
    }

    var errorMapper: [Int: Error]? {
        return [
            401: TimeTableServiceError.unauthorized,
            408: TimeTableServiceError.timeOut,
            409: TimeTableServiceError.conflict,
            429: TimeTableServiceError.tooManyRequests
        ]
    }

    var method: Moya.Method {
        return .get
    }

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }

}
