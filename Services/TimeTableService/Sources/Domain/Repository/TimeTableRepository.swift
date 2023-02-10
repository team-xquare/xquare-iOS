import Foundation

import RxSwift

protocol TimeTableRepository {
    func fetchTimeTableForWeek() -> Observable<[WeekTimeTableEntity]>
}
