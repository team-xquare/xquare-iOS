import Foundation

import RxSwift

protocol LocalDataSource {
    func registerDayToMealMenu(day: Date, breakfast: [String], lunch: [String], dinner: [String])
    func fetchMealMenuPerDay(day: Date) -> Single<DayToMealMenuEntity>
    func fetchMealMenuPerMonth(day: Date) -> Single<[MonthToMealMenuEntity]>
}
