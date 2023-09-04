import Foundation

import RxSwift
import RestApiModule
import Moya

class RemoteAttachmentDataSourceImpl: RestApiRemoteDataSource<AttachmentAPI>, RemoteAttachmentDataSource {
    let provider = MoyaProvider<PresignedUrlAPI>()

    func requestPresignedUrl(files: [Data]) -> Single<[PresigedUrlEntity]> {
        return request(.requestPresignedUrl(files: files))
            .map(PresigedUrlResponses.self)
            .map { $0.toDomain() }
    }

    func uploadImageToS3(presignedURL: String, contentType: String, data: Data) -> Completable {
        return provider.rx.request(.uploadImageToS3(presignedURL: presignedURL, contentType: contentType, data: data))
            .asCompletable()
    }

}
