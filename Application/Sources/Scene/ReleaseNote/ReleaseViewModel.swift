import Foundation
import RxSwift
import XDateUtil
import ReportService

class ReleaseNoteViewModel: ObservableObject {
    @Published var releaseNoteList: [ReleaseNoteEntity] = []

    private let fetchReleaseNoteUseCase: FetchReleaseNoteUseCase

    init(fetchReleaseNoteUseCase: FetchReleaseNoteUseCase) {
        self.fetchReleaseNoteUseCase = fetchReleaseNoteUseCase
    }

    private var disposeBag = DisposeBag()

    func fetchReleaseNote() {
        self.fetchReleaseNoteUseCase.excute()
            .subscribe(onNext: {
                self.releaseNoteList = $0
            }).disposed(by: disposeBag)
    }
    func resetReleaseNoteList() {
        self.releaseNoteList = []
    }

}
