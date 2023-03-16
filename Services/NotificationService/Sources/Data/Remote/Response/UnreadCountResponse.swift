import Foundation

struct UnreadCountResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case unreadCount = "unread_count"
    }
    let unreadCount: Int
}
