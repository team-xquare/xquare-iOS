import Foundation

import RxSwift

protocol RemoteMealDataSource {
    func fetchDayToMealMenu(date: String) -> Observable<DayToMealMenuEntity>
    func fetchMonthToMealMenu(year: String, month: String) -> Observable<[MonthToMealMenuEntity]>
}
