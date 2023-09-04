import Foundation

import Moya
import RxSwift
import XOfflineCache
import XDateUtil

class ScheduleRepositoryImpl: ScheduleRepository {
    let localDataSource: LocalScheduleDataSource
    let remoteDataSource: RemoteScheduleDataSource

    init(
        localDataSource: LocalScheduleDataSource,
        remoteDataSource: RemoteScheduleDataSource
    ) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }

    func fetchScheduleForMonth(month: Int) -> Observable<[ScheduleEntity]> {
        OfflineCacheUtil<[ScheduleEntity]>()
            .localData {
                do {
                    return self.localDataSource.fetchScheduleForMonth(month: month)
                        .map { $0.map { $0.toDomain() } }
                }
            }
            .remoteData {
                self.remoteDataSource.fetchScheduleForMonth(month: month)
            }
            .doOnNeedRefresh(refreshLocalData: { remoteData in
                do {
                    try self.localDataSource.registerScheduleForMonth(schedules: remoteData.map {
                        $0.toDomain()
                    })
                } catch {
                    print(error)
                }
            })
            .createObservable()
    }

    func createSchedule(name: String, date: String) -> Completable {
        return remoteDataSource.createSchedule(name: name, date: date)
    }

    func editSchedule(scheduleId: String, name: String, date: String) -> Completable {
        return remoteDataSource.editShceudle(scheduleId: scheduleId, name: name, date: date)
            .catch { [weak self] error in
                guard let errorCode = self?.errorToStatusCode(error) else { return .error(error) }
                switch errorCode {
                case 404: return .error(ScheduleServiceError.isNotPersonalSchedule)
                default: return .error(error)
                }
            }
    }

    func deleteSchedule(scheduleId: String) -> Completable {
        return remoteDataSource.deleteSchedule(scheduleId: scheduleId)
            .catch { [weak self] error in
                guard let errorCode = self?.errorToStatusCode(error) else { return .error(error) }
                switch errorCode {
                case 404: return .error(ScheduleServiceError.isNotPersonalSchedule)
                default: return .error(error)
                }
            }
    }

}

extension ScheduleRepositoryImpl {

    private func errorToStatusCode(_ error: Error) -> Int? {
        guard let statusCode = (error as? MoyaError)?.response?.statusCode else {
            return nil
        }
        return statusCode
    }

}
