import Foundation

import RxSwift

protocol RemoteDataSource {
    func fetchDayToMealMenu(date: String) -> Observable<DayToMealMenuEntity>
    func fetchMonthToMealMenu(year: String, month: String) -> Observable<[MonthToMealMenuEntity]>
}
