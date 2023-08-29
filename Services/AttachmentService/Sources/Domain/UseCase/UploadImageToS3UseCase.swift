import Foundation

import RxSwift

public class UploadImageToS3UseCase {

    private let repository: AttachmentRepository

    init(repository: AttachmentRepository) {
        self.repository = repository
    }

    public func excute(presigedDatas: [PresigedUrlEntity], imageDatas: [Data]) -> Completable {
        let observable = zip(presigedDatas, imageDatas).map { presigedData, imageData in
            return repository.uploadImageToS3(
                presignedURL: presigedData.presignedUrl,
                contentType: presigedData.contentType,
                data: imageData
            )
        }
        return Completable.zip(observable)
    }

}
