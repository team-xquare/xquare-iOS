import Foundation

public struct ProfileEntity: Equatable {
    public let name: String
    public let id: String
    public let imageUrl: URL?
    public let gradeClassNum: String
    public let birthDay: Date
}
