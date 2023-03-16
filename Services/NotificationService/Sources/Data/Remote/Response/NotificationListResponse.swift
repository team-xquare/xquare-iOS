import Foundation

struct NotificationListResponse: Decodable {
    let notifications: [NotificationResponse]
}

extension NotificationListResponse {
    func toDomain() -> [NotificationEntity] {
        return notifications.map { $0.toDomain() }
    }
}
