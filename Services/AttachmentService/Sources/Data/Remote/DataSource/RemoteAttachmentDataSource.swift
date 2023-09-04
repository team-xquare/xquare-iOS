import Foundation

import RestApiModule
import RxSwift

protocol RemoteAttachmentDataSource: RestApiRemoteDataSource<AttachmentAPI> {
    func requestPresignedUrl(files: [Data]) -> Single<[PresigedUrlEntity]>
    func uploadImageToS3(presignedURL: String, contentType: String, data: Data) -> Completable
}
