import Foundation

import RxSwift

class AttachmentRepositoryImpl: AttachmentRepository {

    private let remoteDataSource: RemoteAttachmentDataSource

    init(remoteDataSource: RemoteAttachmentDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func uploadImage(files: [Data]) -> Single<[String]> {
        return remoteDataSource.uploadFiles(files: files)
    }
}
