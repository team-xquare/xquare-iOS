import Foundation

struct CategoryListResponse: Decodable {
    let settings: [CategoryResponse]
}

extension CategoryListResponse {
    func toDomain() -> [CategoryEntity] {
        return settings.map { $0.toDomain() }
    }
}
