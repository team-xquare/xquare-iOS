import Foundation

struct UserSimpleInformationResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case profileFileName = "profile_file_name"
        case goodPoint = "good_point"
        case badPoint = "bad_point"
    }
    let name: String
    let profileFileName: String?
    let goodPoint: Int
    let badPoint: Int
}

extension UserSimpleInformationResponse {
    func toDomain() -> UserSimpleInformation {
        return .init(
            name: name,
            profileFileName: profileFileName ?? "",
            goodPoint: goodPoint,
            badPoint: badPoint
        )
    }
}
