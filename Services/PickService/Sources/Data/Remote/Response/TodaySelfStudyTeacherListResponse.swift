import Foundation

import XDateUtil

struct TodaySelfStudyTeacherListResponse: Decodable {
    let selfStudyList: [TodaySelfStudyTeacherResponse]

    enum CodingKeys: String, CodingKey {
        case selfStudyList = "self_study_list"
    }
}

extension TodaySelfStudyTeacherListResponse {
    func toDomain() -> [TodaySelfStudyTeacherEntity] {
        return self.selfStudyList.map { $0.toDomain() }
    }
}
