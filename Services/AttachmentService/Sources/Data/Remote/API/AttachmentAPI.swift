import Foundation

import Moya
import RestApiModule
import AuthService

enum AttachmentAPI {
    case uploadFiles(files: [Data])
}

extension AttachmentAPI: XquareAPI {

    var domain: String {
        "/attachment"
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
        case .uploadFiles(let files):
            var multiformData = [MultipartFormData]()
            for file in files {
                multiformData.append(.init(
                    provider: .data(file),
                    name: "files",
                    fileName: "files.jpg",
                    mimeType: "files/jpg"
                ))
            }
            if let jsonData = try? JSONSerialization.data(withJSONObject: ["bucketName": "xquare"] ) {
                multiformData.append(.init(provider: .data(jsonData), name: "request"))
            }
            return .uploadMultipart(multiformData)
        }
    }

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }

}
