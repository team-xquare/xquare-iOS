import Foundation

struct CategoryResponse: Decodable {
    let topic: String
    let isActivate: Bool

    enum CodingKeys: String, CodingKey {
        case topic
        case isActivate = "is_activate"
    }
}

extension CategoryResponse {
    func toDomain() -> CategoryEntity {
        return .init(
            topic: .init(rawValue: topic) ?? .ALL,
            isActivate: isActivate
        )
    }
}
