import Foundation

public struct OutingReturnTimeEntity: Equatable {
    public let userId: String
    public let name: String
    public let endTime: String

    public init(userId: String, name: String, endTime: String) {
        self.userId = userId
        self.name = name
        self.endTime = endTime
    }
}
