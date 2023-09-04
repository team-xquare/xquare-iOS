import Foundation

struct PresigedUrlResponses: Decodable {
    enum CodingKeys: String, CodingKey {
        case presignedURLs = "presigned_urls"
    }

    let presignedURLs: [PresigedUrlResponse]
}

extension PresigedUrlResponses {
    func toDomain() -> [PresigedUrlEntity] {
        return presignedURLs.map { $0.toDomain() }
    }
}
