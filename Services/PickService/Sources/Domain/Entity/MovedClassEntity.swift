import Foundation

public struct MovedClassEntity: Equatable {
    public let name: String
    public let locationClassroom: String

    public init(name: String, locationClassroom: String) {
        self.name = name
        self.locationClassroom = locationClassroom
    }
}
