import Foundation

public struct ReleaseNoteEntity: Equatable {
    public let releaseNoteID, releaseVersion, featureContent, bugFixContent: String

    public init(releaseNoteID: String, releaseVersion: String, featureContent: String, bugFixContent: String) {
        self.releaseNoteID = releaseNoteID
        self.releaseVersion = releaseVersion
        self.featureContent = featureContent
        self.bugFixContent = bugFixContent
    }
}
