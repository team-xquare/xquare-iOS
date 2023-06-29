import Foundation

import RxSwift
import ScheduleService

class WriteScheduleViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var day: String = ""
    @Published var postButtonIsDisabled: Bool = true
    @Published var isSuccess: Bool = false

    private let createScheduleUseCase: CreateScheduleUseCase

    private var disposeBag = DisposeBag()

    init(createScheduleUseCase: CreateScheduleUseCase) {
        self.createScheduleUseCase = createScheduleUseCase
    }

    func createSchedule() {
        self.createScheduleUseCase.excute(name: title, date: day.toDate(format: .fullDate))
            .subscribe(onCompleted: {
                self.resetData()
                self.isSuccess = true
            })
            .disposed(by: disposeBag)
    }
    func checkStringDatasIsEmpty() {
        self.postButtonIsDisabled = isTitleCheck() || day.isEmpty
    }
    func isTitleCheck() -> Bool {
        let strRegEx = "^(?! )[\\s\\S]{2,}$"
        let pred = NSPredicate(format: "SELF MATCHES %@", strRegEx)

        return !pred.evaluate(with: self.title)
    }
    func resetData() {
        self.title = ""
        self.day = ""
        self.postButtonIsDisabled = true
        self.isSuccess = false
    }

}
