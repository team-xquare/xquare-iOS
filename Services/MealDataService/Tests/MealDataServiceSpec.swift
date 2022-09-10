@testable import MealDataService

import RxSwift
import Quick
import Nimble
import Foundation

class MealDataServiceSpec: QuickSpec {

    private let localDataSourceImpl = LocalDataSourceImpl()
    private let mealDataService = MealDataServiceDependency.resolve()
    private let toDay = Date()
    var mealMenu: MealMenu?
    var mealMenuList: [MealMenu]?

    override func spec() {
        describe("Meal 데이터를") {
            context("하루 받아올 때") {
                beforeEach { [self] in
                    self.mealDataService.fetchDayToMealMenuUseCase.excute(date: toDay)
                        .asObservable()
                        .subscribe(onNext: {
                            self.localDataSourceImpl.registerMealMenuPerDay(menu: self.toMealMenu($0))
                        }).dispose()
                    self.localDataSourceImpl.fetchMealMenuPerDay(day: toDay)
                        .timeout(.seconds(1), scheduler: MainScheduler.asyncInstance)
                        .asObservable()
                        .subscribe(onNext: {
                            self.mealMenu = $0
                        }).dispose()
                }
                it("로컬 DB에 저장되고 값이 같아야 한다.") {
                    self.mealDataService.fetchDayToMealMenuUseCase.excute(date: self.toDay)
                        .asObservable()
                        .subscribe(onNext: {
                            expect(self.mealMenu) == self.toMealMenu($0)
                        }).dispose()
                }
            }
            context("한 달 받아올 때") {
                beforeEach { [self] in
                    self.mealDataService.fetchMonthToMealMenuUseCase.excute(date: toDay)
                        .asObservable()
                        .subscribe(onNext: {
                            self.localDataSourceImpl.registerMealMenuPerMonth(menu: $0.map { self.toMealMenu($0) })
                        }).dispose()
                    self.localDataSourceImpl.fetchMealMenuPerMonth(day: toDay)
                        .timeout(.seconds(1), scheduler: MainScheduler.asyncInstance)
                        .asObservable()
                        .subscribe(onNext: {
                            self.mealMenuList = $0
                        }).dispose()
                }
                it("로컬 DB에 저장된 값이 같아야 한다.") {
                    self.mealDataService.fetchMonthToMealMenuUseCase.excute(date: self.toDay)
                        .asObservable()
                        .subscribe(onNext: {
                            expect(self.mealMenuList) == $0.map { self.toMealMenu($0) }
                        }).dispose()
                }
            }
        }
    }

    private func toMealMenu(_ menu: MealMenuPerDayEntity) -> MealMenu {
        var breakfast: String = ""
        var lunch: String = ""
        var dinner: String = ""
        for menu in menu.menu {
            switch menu.mealTime {
            case .breakfast:
                breakfast = menu.menu?.joined(separator: " ") ?? ""
            case .lunch:
                lunch = menu.menu?.joined(separator: " ") ?? ""
            case .dinner:
                dinner = menu.menu?.joined(separator: " ") ?? ""
            }
        }
        return MealMenu(
            day: menu.date,
            breakfast: breakfast,
            lunch: lunch,
            dinner: dinner
        )
    }
}
