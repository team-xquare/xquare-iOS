import Foundation

struct ImageUrlResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imageUrlString = "image_url"
    }
    let imageUrlString: [String]
}
