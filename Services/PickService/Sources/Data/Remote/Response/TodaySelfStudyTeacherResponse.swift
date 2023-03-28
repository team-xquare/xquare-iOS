import Foundation

import XDateUtil

struct TodaySelfStudyTeacherResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case secondFloor = "second_floor"
        case thirdFloor = "third_floor"
        case fourthFloor = "fourth_floor"
    }

    let secondFloor: String
    let thirdFloor: String
    let fourthFloor: String

}

extension TodaySelfStudyTeacherResponse {
    func toDomain() -> TodaySelfStudyTeacherEntity {
        return .init(
            secondFloor: self.secondFloor,
            thirdFloor: self.thirdFloor,
            fourthFloor: self.fourthFloor
        )
    }
}
