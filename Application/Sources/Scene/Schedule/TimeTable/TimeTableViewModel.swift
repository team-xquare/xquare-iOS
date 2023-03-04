import Foundation

import RxSwift
import TimeTableService

class TimeTableViewModel: ObservableObject {
    @Published var timeTable: [WeekTimeTableEntity] = []

    private let fetchTimeTableForWeekUseCase: FetchTimeTableForWeekUseCase

    private var disposeBag = DisposeBag()

    init(fetchTimeTableForWeekUseCase: FetchTimeTableForWeekUseCase) {
        self.fetchTimeTableForWeekUseCase = fetchTimeTableForWeekUseCase
    }

    func fetchTimeTable() {
        self.fetchTimeTableForWeekUseCase.excute()
            .subscribe(onNext: {
                self.timeTable = $0
            })
            .disposed(by: disposeBag)
    }
}
