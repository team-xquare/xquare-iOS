import Foundation

import RxSwift

class PickRepositoryImpl: PickRepository {
    private let remoteDataSource: RemotePickDataSource

    init(remoteDataSource: RemotePickDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchOutingReturnTime() -> Observable<OutingReturnTimeEntity> {
        return remoteDataSource.fetchOutingReturnTime()
            .asObservable()
    }

    func fetchOutingPass() -> Observable<OutingPassEntity> {
        return remoteDataSource.fetchOutingPass()
            .asObservable()
    }

    func fetchMovedClass() -> Observable<MovedClassEntity> {
        return remoteDataSource.fetchMovedClass()
            .asObservable()
    }

    func fetchTodaySelfStudyTeacher(month: Date) -> Observable<[TodaySelfStudyTeacherEntity]> {
        return remoteDataSource.fetchTodaySelfStudyTeacher(month: month.toString(format: .month))
            .asObservable()
    }

    func deleteReturnClass() -> Completable {
        return remoteDataSource.deleteReturnClass()
    }

}
