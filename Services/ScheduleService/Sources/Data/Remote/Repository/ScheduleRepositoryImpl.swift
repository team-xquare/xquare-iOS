import Foundation

import Moya
import RxSwift

class ScheduleRepositoryImpl: ScheduleRepository {

    let remoteDataSource: RemoteScheduleDataSource

    init(remoteDataSource: RemoteScheduleDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchScheduleForMonth(month: Int) -> Observable<[ScheduleEntity]> {
        return remoteDataSource.fetchScheduleForMonth(month: month)
            .asObservable()
    }

    func createSchedule(name: String, date: String) -> Completable {
        return remoteDataSource.createSchedule(name: name, date: date)
    }

    func editSchedule(scheduleId: String, name: String, date: String) -> Completable {
        return remoteDataSource.editShceudle(scheduleId: scheduleId, name: name, date: date)
            .catch { [weak self] error in
                let moyaError = error as? MoyaError
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
                let moyaError = error as? MoyaError
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
