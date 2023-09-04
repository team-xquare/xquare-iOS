import Foundation

import RxSwift

class AttachmentRepositoryImpl: AttachmentRepository {

    private let remoteDataSource: RemoteAttachmentDataSource

    init(remoteDataSource: RemoteAttachmentDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func requestPresignedUrl(files: [Data]) -> Single<[PresigedUrlEntity]> {
        return remoteDataSource.requestPresignedUrl(files: files)
    }

    func uploadImageToS3(presignedURL: String, contentType: String, data: Data) -> Completable {
        return remoteDataSource.uploadImageToS3(
            presignedURL: presignedURL,
            contentType: contentType,
            data: data
        )
    }
}
