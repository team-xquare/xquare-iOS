import Foundation

struct ReleaseNoteResponse: Codable {
    let releaseNoteID, releaseVersion, featureContent, bugFixContent: String

    enum CodingKeys: String, CodingKey {
        case releaseNoteID = "release_note_id"
        case releaseVersion = "release_version"
        case featureContent = "feature_content"
        case bugFixContent = "bug_fix_content"
    }
}

extension ReleaseNoteResponse {
    func toDomain() -> ReleaseNoteEntity {
        return .init(
            releaseNoteID: self.releaseNoteID,
            releaseVersion: self.releaseVersion,
            featureContent: self.featureContent,
            bugFixContent: self.bugFixContent
        )
    }
}
