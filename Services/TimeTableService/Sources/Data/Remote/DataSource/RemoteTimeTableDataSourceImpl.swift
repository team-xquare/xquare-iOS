import Foundation

import RestApiModule
import RxSwift

class RemoteTimeTableDataSourceImpl: RestApiRemoteDataSource<TimeTableAPI>, RemoteTimeTableDataSource {

    func fetchTimeTableForWeek() -> Single<[WeekTimeTableEntity]> {
        return request(.fetchTimeTableForWeek)
            .map(WeekTimeTableListResponse.self)
            .map { $0.toDomain() }
    }

}
