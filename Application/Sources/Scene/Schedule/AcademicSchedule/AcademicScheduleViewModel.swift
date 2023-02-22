import Foundation

import RxSwift
import ScheduleService

class AcademicScheduleViewModel: ObservableObject {
    @Published var day = Date()
    @Published var schedule: [ScheduleEntity] = []

    private let fetchSchedulePerMonthUseCase: FetchSchedulePerMonthUseCase

    private var disposeBag = DisposeBag()

    init(fetchSchedulePerMonthUseCase: FetchSchedulePerMonthUseCase) {
        self.fetchSchedulePerMonthUseCase = fetchSchedulePerMonthUseCase
    }

    func fetchScheduleForMonth() {
        self.fetchSchedulePerMonthUseCase.excute(month: day)
            .subscribe(onNext: {
                self.schedule = $0
            })
            .disposed(by: disposeBag)
    }
}
