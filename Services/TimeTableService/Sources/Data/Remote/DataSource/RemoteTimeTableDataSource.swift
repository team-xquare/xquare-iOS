import Foundation

import RestApiModule
import RxSwift

protocol RemoteTimeTableDataSource: RestApiRemoteDataSource<TimeTableAPI> {
    func fetchTimeTableForWeek() -> Single<[WeekTimeTableEntity]>
}
