import Foundation

struct CategoryResponse: Decodable {
    let id: String
    let name: String
    let destination: String
}

extension CategoryResponse {
    func toDomain() -> CategoryEntity {
        return .init(
            id: id,
            name: name,
            destination: destination
        )
    }
}
