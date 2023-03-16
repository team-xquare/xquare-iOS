import Foundation

public struct NotificationEntity: Equatable {
    public let id: String
    public let title: String
    public let content: String
    public let sendAt: Date
    public let isRead: Bool
    public let userId: String
    public let name: String
    public let destination: String
}
