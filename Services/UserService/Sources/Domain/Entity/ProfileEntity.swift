import Foundation

public struct ProfileEntity: Equatable {
    public let name: String
    public let id: String
    public let imageUrl: URL?
    public let grade: Int
    public let classNumber: Int
    public let number: Int
    public let birthDay: Date
}
