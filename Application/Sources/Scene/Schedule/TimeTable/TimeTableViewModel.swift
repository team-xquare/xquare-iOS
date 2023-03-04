import Foundation

import RxSwift
import TimeTableService

class TimeTableViewModel: ObservableObject {
    @Published var weekDay: Int = 1
    @Published var timeTable: [WeekTimeTableEntity] = []

    private let fetchTimeTableForWeekUseCase: FetchTimeTableForWeekUseCase

    private var disposeBag = DisposeBag()

    init(fetchTimeTableForWeekUseCase: FetchTimeTableForWeekUseCase) {
        self.fetchTimeTableForWeekUseCase = fetchTimeTableForWeekUseCase
    }

    // swiftlint:disable line_length
    func fetchTimeTable() {
        self.fetchTimeTableForWeekUseCase.excute()
            .subscribe(onNext: {
                self.timeTable = $0
                self.weekDay = self.getWeekDay() != 6 && self.getWeekDay() != 7 ? self.getWeekDay() : $0.first?.weekDay ?? 1
            })
            .disposed(by: disposeBag)
    }
    private func getWeekDay() -> Int {
        return (Calendar.current.dateComponents([.weekday], from: Date()).weekday ?? 0) - 1
    }
}
