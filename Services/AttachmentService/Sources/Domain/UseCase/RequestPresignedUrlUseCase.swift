import Foundation

import RxSwift

public class RequestPresignedUrlUseCase {

    private let repository: AttachmentRepository

    init(repository: AttachmentRepository) {
        self.repository = repository
    }

    public func excute(files: [Data]) -> Single<[PresigedUrlEntity]> {
        return repository.requestPresignedUrl(files: files)
    }

}
