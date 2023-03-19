import SwiftUI

import RxSwift
import PickService

class OutingPassViewModel: ObservableObject {

    private let fetchOutingPassUseCase: FetchOutingPassUseCase

    init(fetchOutingPassUseCase: FetchOutingPassUseCase) {
        self.fetchOutingPassUseCase = fetchOutingPassUseCase
    }

    private var disposeBag = DisposeBag()

    @Published var name: String = ""
    @Published var studentNumber: String = ""
    @Published var imageUrl: String = ""
    @Published var time: String = ""
    @Published var resone: String = ""
    @Published var teacher: String  = ""

    func fetchOutingPass() {
        self.fetchOutingPassUseCase.excute()
            .subscribe(onNext: {
                self.name = $0.studentName
                self.studentNumber = $0.studentNumber
                self.imageUrl = $0.profileFileName
                self.time = "\($0.startTime.toString(format: "HH:mm")) ~ \($0.endTime.toString(format: "HH:mm"))"
                self.resone = $0.reason
                self.teacher = $0.teacherName
            })
            .disposed(by: disposeBag)
    }
}
