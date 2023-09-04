import Foundation

import RxSwift
import XDateUtil
import Boutique

class LocalScheduleDataSourceImpl: LocalScheduleDataSource {
    let store = Store<ScheduleForMonth>(
        storage: SQLiteStorageEngine(directory: .defaultStorageDirectory(appendingPath: "ScheduleList"))!,
        cacheIdentifier: \.id
    )
    func registerScheduleForMonth(schedules: [ScheduleForMonth]) throws {
        for schedule in schedules {
            Task {
                do {
                    let specialDay = ScheduleForMonth(
                        id: schedule.id,
                        name: schedule.name,
                        date: schedule.date
                    )
                    try await store
                        .insert(specialDay)
                        .run()
                } catch {
                    print("Error inserting meal menu: \(error.localizedDescription)")
                }
            }
        }
    }
    func fetchScheduleForMonth(month: Int) -> Single<[ScheduleForMonth]> {
        return Single.create { single -> Disposable in
            Task {
                let specialDays = await self.store
                    .items
                    .filter {
                        $0.date.toDate(format: .fullDate).toString(format: .month).contains("\(month)")
                    }
                single(.success(specialDays))
            }

            return Disposables.create()
        }
    }
}
