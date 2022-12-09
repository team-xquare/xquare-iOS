import Foundation

import RxSwift
import RestApiModule

class RemoteAttachmentDataSourceImpl: RestApiRemoteDataSource<AttachmentAPI>, RemoteAttachmentDataSource {

    func uploadFiles(files: [Data]) -> Single<[String]> {
        return request(.uploadFiles(files: files))
            .map(ImageUrlResponse.self)
            .map { $0.imageUrlString }
    }

}
