import Foundation

import AuthService
import RestApiModule
import Moya

enum NotificationAPI {
    case fetchNotificationCategoryList(defaultActivated: Bool)
    case fetchActivatedNotificationCategoryList
    case activeNotificationCategory(topic: String, isActivated: Bool)
    case fetchPostedNotificationList
    case checkNotification(notificationId: String)
    case fetchUncheckNotificationCount
}

extension NotificationAPI: XquareAPI {

    var domain: String {
        return "/notifications"
    }

    var urlPath: String {
        switch self {
        case .fetchNotificationCategoryList:
            return "/categories"
        case .fetchActivatedNotificationCategoryList, .activeNotificationCategory:
            return "/tags"
        case .checkNotification(let notificationId):
            return "/\(notificationId)"
        case .fetchUncheckNotificationCount:
            return "/unread"
        default:
            return "/list"
        }
    }

    var errorMapper: [Int: Error]? {
        [
            401: NotificationServiceError.unauthorized,
            408: NotificationServiceError.timeOut,
            409: NotificationServiceError.conflict,
            429: NotificationServiceError.tooManyRequests
        ]
    }

    var method: Moya.Method {
        switch self {
        case .activeNotificationCategory:
            return .patch
        case .checkNotification:
            return .post
        default:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .fetchNotificationCategoryList(let defaultActivated):
            return .requestParameters(
                parameters: [
                    "default_activated": defaultActivated
                ],
                encoding: URLEncoding.default
            )
        case .activeNotificationCategory(let topic, let isActivated):
            return .requestParameters(
                parameters: [
                    "topic": topic,
                    "is-activated": isActivated
                ],
                encoding: URLEncoding.queryString
            )
        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }

}
