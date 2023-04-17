import Foundation

struct PostBugRequest: Encodable {

    private enum CodingKeys: String, CodingKey {
        case reason
        case category
        case imageUrls = "image_urls"
    }

    let reason: String
    let category: String
    let imageUrls: [String]

}
