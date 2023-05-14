import Foundation

import RxSwift

public class FetchReleaseNoteUseCase {

    private let repository: ReportRepository

    init(repository: ReportRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<[ReleaseNoteEntity]> {
        return repository.fetchReleaseNote()
    }

}
