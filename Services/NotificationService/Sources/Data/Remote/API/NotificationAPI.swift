import Foundation

import AuthService
import RestApiModule
import Moya

enum NotificationAPI {
    case fetchNotificationCategoryList(defaultActivated: Bool)
    case fetchActivatedNotificationCategoryList
    case activeNotificationCategory(categoryId: String)
    case inactiveNotificationCategory(categoryId: String)
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
        case .fetchActivatedNotificationCategoryList:
            return "/tags"
        case .activeNotificationCategory(let categoryId), .inactiveNotificationCategory(let categoryId):
            return "/tags/\(categoryId)"
        case .checkNotification(let notificationId):
            return "/\(notificationId)"
        case .fetchUncheckNotificationCount:
            return "/unread"
        default:
            return ""
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
        case .inactiveNotificationCategory:
            return .delete
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
        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }

}
