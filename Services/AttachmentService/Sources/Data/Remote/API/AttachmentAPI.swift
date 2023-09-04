import Foundation

import Moya
import RestApiModule
import AuthService

enum AttachmentAPI {
    case requestPresignedUrl(files: [Data])
}

extension AttachmentAPI: XquareAPI {

    var domain: String {
        return "/attachment"
    }

    var urlPath: String {
        return ""
    }

    var errorMapper: [Int: Error]? {
        return nil
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        switch self {
        case .requestPresignedUrl(let files):
            var imageParameters: [[String: Any]] = []
            for file in files {
                imageParameters.append(
                    [
                        "original_filename": "image.jpg",
                        "content_type": "image/jpg",
                        "file_size": file.count
                    ]
                )
            }
            return .requestParameters(parameters: [
                "image_file_requests": imageParameters
            ], encoding: JSONEncoding.default)
        }
    }

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }

}
