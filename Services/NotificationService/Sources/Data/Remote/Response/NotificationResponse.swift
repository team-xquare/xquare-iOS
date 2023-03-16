import Foundation

import XDateUtil

struct NotificationResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case content
        case sendAt = "send_at"
        case isRead = "is_read"
        case userId = "user_id"
        case name
        case destination
    }
    let id: String
    let title: String
    let content: String
    let sendAt: String
    let isRead: Bool
    let userId: String
    let name: String
    let destination: String
}

extension NotificationResponse {
    func toDomain() -> NotificationEntity {
        return .init(
            id: id,
            title: title,
            content: content,
            sendAt: sendAt.toDate(format: .fullDate),
            isRead: isRead,
            userId: userId,
            name: name,
            destination: destination
        )
    }
}
