import Foundation

public struct ReleaseNoteListEntity: Equatable {
    public let releaseNoteList: [ReleaseNoteEntity]

    public init(releaseNoteList: [ReleaseNoteEntity]) {
        self.releaseNoteList = releaseNoteList
    }
}
