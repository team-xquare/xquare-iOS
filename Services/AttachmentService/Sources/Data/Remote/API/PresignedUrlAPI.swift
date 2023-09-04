import Moya
import Foundation

enum PresignedUrlAPI {
    case uploadImageToS3(presignedURL: String, contentType: String, data: Data)
}

extension PresignedUrlAPI: TargetType {

    var baseURL: URL {
        switch self {
        case .uploadImageToS3(let presignedURL, _, _):
            return URL(string: presignedURL)!
        }
    }

    var path: String {
        return ""
    }

    var method: Moya.Method {
        return .put
    }

    var task: Moya.Task {
        switch self {
        case .uploadImageToS3(_, _, let data):
            return .requestData(data)
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "image/jpg"]
    }
}
