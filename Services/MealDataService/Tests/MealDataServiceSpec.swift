@testable import MealDataService

import RxSwift
import Quick
import Foundation

class MealDataServiceSpec: QuickSpec {

    private let localDataSourceImpl = LocalDataSourceImpl()
    private let toDay = Date()

    override func spec() {
        describe("스퀘어 홈화면에 들어온다") {
            context("급식 메뉴를 받아온다") {
                it("급식 메뉴가 저번이랑 다르다") { [self] in
                    self.localDataSourceImpl.registerMealMenuPerDay(
                        menu: .init(
                            date: toDay,
                            menu: [
                                .init(mealTime: .breakfast, menu: ["밥", "국"]),
                                .init(mealTime: .lunch, menu: ["밥", "국"]),
                                .init(mealTime: .dinner, menu: ["밥", "국"])
                            ]
                        ))
                    self.localDataSourceImpl.fetchMealMenuPerDay(day: toDay)
                        .timeout(.seconds(1), scheduler: MainScheduler.asyncInstance)
                        .asObservable()
                        .subscribe(onNext: {
                            print("!!!\($0)")
                        }).dispose()
                }
                it("메뉴를 한달치 받아오는데 저번달에 입력된 메뉴와 이번달에 메뉴가 다르다.") { [self] in
                    self.localDataSourceImpl.registerMealMenuPerMonth(menu: [
                        .init(date: toDay, menu: [
                            .init(mealTime: .breakfast, menu: ["밥", "국"]),
                            .init(mealTime: .lunch, menu: ["밥", "국"]),
                            .init(mealTime: .dinner, menu: ["밥", "국"])
                        ]),
                        .init(date: Calendar.current.date(byAdding: .day, value: 1, to: toDay)!, menu: [
                            .init(mealTime: .breakfast, menu: ["밥", "국"]),
                            .init(mealTime: .lunch, menu: ["밥", "국"]),
                            .init(mealTime: .dinner, menu: ["밥", "국"])
                        ])
                        ])
                        self.localDataSourceImpl.fetchMealMenuPerMonth(day: toDay)
                        .timeout(.seconds(1), scheduler: MainScheduler.asyncInstance)
                        .asObservable()
                        .subscribe(onNext: {
                            print("!!!\($0)")
                        }).dispose()
                }
            }
        }
    }
}
