import Foundation
import RxSwift
import XDateUtil

class SelfStudyTeacherViewModel: ObservableObject {

    @Published var dateToShowData: Int?

    func dateToShowDatas() {
        self.dateToShowData = calculateDateToShowData()
    }
    private var disposeBag = DisposeBag()

    private func calculateDateToShowData() -> Int {
        let today = Calendar.current.startOfDay(for: Date())
        return Int(today.toString(format: "d")) ?? 0
    }

}
