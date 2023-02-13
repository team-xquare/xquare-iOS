import Foundation

import RxSwift
import ScheduleService

class AcademicScheduleViewModel: ObservableObject {
    @Published var day = Date()
    @Published var schedule: [ScheduleEntity] = []

    private let fetchScheduleForMonthUseCase: FetchScheduleForMonthUseCase

    private var disposeBag = DisposeBag()

    init(fetchScheduleForMonthUseCase: FetchScheduleForMonthUseCase) {
        self.fetchScheduleForMonthUseCase = fetchScheduleForMonthUseCase
    }

    func fetchScheduleForMonth() {
        self.fetchScheduleForMonthUseCase.excute(month: day)
            .subscribe(onNext: {
                self.schedule = $0
            })
            .disposed(by: disposeBag)
    }
}
