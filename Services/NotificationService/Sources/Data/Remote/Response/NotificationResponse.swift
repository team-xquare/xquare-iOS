import Foundation

import XDateUtil

struct NotificationResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case content
        case sendAt = "sent_at"
        case isRead = "is_read"
        case userId = "user_id"
        case destination
        case categoryName = "category_name"
        case topic
    }
    let id: String
    let title: String
    let content: String
    let sendAt: String
    let isRead: Bool
    let userId: String
    let destination: String
    let categoryName: String
    let topic: String
}

extension NotificationResponse {
    func toDomain() -> NotificationEntity {
        return .init(
            id: id,
            title: title,
            content: content,
            sendAt: sendAt.toDate(format: "yyyy-MM-dd'T'HH:mm:ss"),
            isRead: isRead,
            userId: userId,
            destination: destination,
            categoryName: categoryName,
            topic: .init(rawValue: topic) ?? .all
        )
    }
}
