import Foundation

import RxSwift

public class UploadImageUseCase {

    private let repository: AttachmentRepository

    init(repository: AttachmentRepository) {
        self.repository = repository
    }

    public func excute(files: [Data]) -> Single<[String]> {
        return repository.uploadImage(files: files)
    }

}
