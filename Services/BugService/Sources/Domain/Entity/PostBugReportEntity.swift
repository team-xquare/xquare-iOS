import Foundation

public struct PostBugReportEntity {
    let reason: String
    let category: String
    let imageUrls: [String]

    public init(
        reason: String,
        category: String,
        imageUrls: [String]
    ) {
        self.reason = reason
        self.category = category
        self.imageUrls = imageUrls
    }
}
