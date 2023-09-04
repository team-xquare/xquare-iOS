import Foundation

struct PresigedUrlResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case presignedUrl = "presigned_url"
        case originalFilename = "original_filename"
        case contentType = "content_type"
        case url
    }

    let url: String
    let presignedUrl: String
    let originalFilename: String
    let contentType: String
}

extension PresigedUrlResponse {
    func toDomain() -> PresigedUrlEntity {
        return .init(
            url: url,
            presignedUrl: presignedUrl,
            originalFilename: originalFilename,
            contentType: contentType
        )
    }
}
