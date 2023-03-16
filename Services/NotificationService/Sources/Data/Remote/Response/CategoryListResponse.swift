import Foundation

struct CategoryListResponse: Decodable {
    let categories: [CategoryResponse]
}

extension CategoryListResponse {
    func toDomain() -> [CategoryEntity] {
        return categories.map { $0.toDomain() }
    }
}
