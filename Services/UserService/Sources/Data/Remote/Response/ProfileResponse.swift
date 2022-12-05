import Foundation

struct ProfileResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case id = "account_id"
        case profileImageUrlString = "profile_file_name"
        case num
        case classNum = "class_num"
        case grade
        case birthDay = "birth_day"
    }
    let name: String
    let id: String
    let profileImageUrlString: String?
    let num: Int
    let classNum: Int
    let grade: Int
    let birthDay: String
}

extension ProfileResponse {
    func toDomain() -> ProfileEntity {
        return .init(
            name: name,
            id: id,
            imageUrl: URL(string: profileImageUrlString ?? ""),
            gradeClassNum: "\(grade)학년 \(classNum)반 \(num)번",
            birthDay: birthDay.toDate(format: .fullDate)
        )
    }
}
