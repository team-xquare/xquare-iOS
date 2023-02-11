import Foundation

import RxSwift

class TimeTableRepositoryImpl: TimeTableRepository {

    let remoteDataSource: RemoteTimeTableDataSource

    init(remoteDataSource: RemoteTimeTableDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchTimeTableForWeek() -> Observable<[WeekTimeTableEntity]> {
        return remoteDataSource.fetchTimeTableForWeek()
            .asObservable()
    }

}
