import Foundation
import RxSwift
import XDateUtil
import PickService

class SelfStudyTeacherViewModel: ObservableObject {
    @Published var selfStudyList: [TodaySelfStudyTeacherEntity] = []
    @Published var dateToShowData: Int?

    private let fetchTodaySelfStudyTeacherUseCase: FetchTodaySelfStudyTeacherUseCase

    init(fetchTodaySelfStudyTeacherUseCase: FetchTodaySelfStudyTeacherUseCase) {
        self.fetchTodaySelfStudyTeacherUseCase = fetchTodaySelfStudyTeacherUseCase
    }

    private var disposeBag = DisposeBag()

    func fetchTodaySelfStudyTeacherPerMonth() {
        self.fetchTodaySelfStudyTeacherUseCase.excute(month: Date())
            .subscribe(onNext: { [weak self] in
                self?.selfStudyList = $0
                self?.dateToShowData = self?.calculateDateToShowData(allMenu: $0)
            }).disposed(by: disposeBag)
    }

    private func calculateDateToShowData(allMenu: [TodaySelfStudyTeacherEntity]) -> Int {
        let today = Calendar.current.startOfDay(for: Date())
        return allMenu.firstIndex {
            let day = $0.date.filter { Int(String($0)) != nil }[1...]
            return Int(String(day)) ?? 0 >= Int(today.toString(format: "d")) ?? 0
        } ?? 0
    }

}
