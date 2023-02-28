import Foundation

public struct PointHistoryEntity: Equatable {
    public let id: String
    public let date: Date
    public let reason: String
    public let pointType: Bool
    public let point: Int
}
