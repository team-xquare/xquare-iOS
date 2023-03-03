import Foundation

public struct PointEntity: Equatable {
    public let goodPoint: Int
    public let badPoint: Int
    public let pointHistories: [PointHistoryEntity]

    public init(goodPoint: Int, badPoint: Int, pointHistories: [PointHistoryEntity]) {
        self.goodPoint = goodPoint
        self.badPoint = badPoint
        self.pointHistories = pointHistories
    }
}
