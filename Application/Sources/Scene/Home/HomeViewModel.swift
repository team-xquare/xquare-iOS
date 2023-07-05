import SwiftUI

import MealDataService
import UserService
import PickService
import RxSwift

class HomeViewModel: ObservableObject {

    private var disposeBag = DisposeBag()

    @Published var imageUrl: String = ""
    @Published var name: String = ""
    @Published var merit: Int = 0
    @Published var demerit: Int = 0
    @Published var menu: [MealMenuEntity] = []
    @Published var endTime: Date = Date()
    @Published var locationClassroom: String = ""
    @Published var isShowOutingView: Bool = false
    @Published var isShowMovedClass: Bool = false
    @Published var isPresentErrorAlert: Bool = false
    @Published var isSuccessReturnClass: Bool = false

    private let fetchMealMenuPerDayUseCase: FetchMealMenuPerDayUseCase
    private let fetchUserPointUseCase: FetchUserSimpleInformationUseCase
    private let fetchOutingReturnTimeUseCase: FetchOutingReturnTimeUseCase
    private let fetchMovedClassUseCase: FetchMovedClassUseCase
    private let deleteReturnClassUseCase: DeleteReturnClassUseCase

    init(
        fetchMealMenuPerDayUseCase: FetchMealMenuPerDayUseCase,
        fetchUserPointUseCase: FetchUserSimpleInformationUseCase,
        fetchOutingReturnTimeUseCase: FetchOutingReturnTimeUseCase,
        fetchMovedClassUseCase: FetchMovedClassUseCase,
        deleteReturnClassUseCase: DeleteReturnClassUseCase
    ) {
        self.fetchMealMenuPerDayUseCase = fetchMealMenuPerDayUseCase
        self.fetchUserPointUseCase = fetchUserPointUseCase
        self.fetchOutingReturnTimeUseCase = fetchOutingReturnTimeUseCase
        self.fetchMovedClassUseCase = fetchMovedClassUseCase
        self.deleteReturnClassUseCase = deleteReturnClassUseCase
    }

    func fetchTodaysMeal() {
        self.fetchMealMenuPerDayUseCase.excute(date: Date())
            .subscribe(onNext: {
                self.menu = $0.menu
            })
            .disposed(by: disposeBag)
    }

    func fetchUserPoint() {
        self.fetchUserPointUseCase.excute()
            .asObservable()
            .subscribe(onNext: {
                self.name = $0.name
                self.imageUrl = $0.profileFileName
                self.merit = $0.goodPoint
                self.demerit = $0.badPoint
            }).disposed(by: disposeBag)
    }

    func fetchOutingPass() {
        self.fetchOutingReturnTimeUseCase.excute()
            .subscribe(onNext: {
                self.name = $0.name
                self.endTime = $0.endTime
                self.isShowOutingView = true
            }, onError: {
                print($0)
                self.isShowOutingView = false
            })
            .disposed(by: disposeBag)
    }

    func fetchMovedClass() {
        self.fetchMovedClassUseCase.excute()
            .subscribe(onNext: {
                self.name = $0.name
                self.locationClassroom = $0.locationClassroom
                self.isShowMovedClass = true
            }, onError: {
                print($0)
                self.isShowMovedClass = false
            })
            .disposed(by: disposeBag)
    }

    func deleteReturnClass() {
        self.deleteReturnClassUseCase.excute()
            .subscribe(onCompleted: {
                self.isSuccessReturnClass = true
                self.isShowMovedClass = false
            }, onError: { _ in
                self.isPresentErrorAlert = true
            })
            .disposed(by: disposeBag)
    }
}
