import Foundation

struct MovedClassResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case locationClassroom = "location_classroom"
    }
    
    let name: String
    let locationClassroom: String
    
}

extension MovedClassResponse {
    func toDomain() -> MovedClassEntity {
        return .init(
            name: self.name,
            locationClassroom: self.locationClassroom
        )
    }
}
