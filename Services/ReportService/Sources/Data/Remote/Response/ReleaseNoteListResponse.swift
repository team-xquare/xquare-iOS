import Foundation

struct ReleaseNoteListResponse: Codable {
    let releaseNoteList: [ReleaseNoteResponse]

    enum CodingKeys: String, CodingKey {
        case releaseNoteList = "release_note_list"
    }
}

extension ReleaseNoteListResponse {
    func toDomain() -> [ReleaseNoteEntity] {
        return self.releaseNoteList.map { $0.toDomain() }
    }
}
