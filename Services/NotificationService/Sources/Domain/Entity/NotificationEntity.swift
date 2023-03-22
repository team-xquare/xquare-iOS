import Foundation

public struct NotificationEntity: Equatable {
    public let id: String
    public let title: String
    public let content: String
    public let sendAt: Date
    public let isRead: Bool
    public let userId: String
    public let destination: String
    public let categoryName: String
    public let topic: NotificationTopic
}
