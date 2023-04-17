import Foundation

struct PostBugReportResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case reportId = "report_id"
    }

    let reportId: String
}
