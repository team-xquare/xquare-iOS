import Foundation

import RxSwift

protocol AttachmentRepository {
    func requestPresignedUrl(files: [Data]) -> Single<[PresigedUrlEntity]>
    func uploadImageToS3(presignedURL: String, contentType: String, data: Data) -> Completable
}
