import Foundation

struct ImageUrlResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imageUrlString = "fileUrl"
    }
    let imageUrlString: [String]
}
