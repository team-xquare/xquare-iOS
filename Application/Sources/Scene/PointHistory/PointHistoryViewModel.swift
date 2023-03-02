import Foundation

import RxSwift
import PointService

class PointHistoryViewModel: ObservableObject {
    @Published var type = true
    @Published var pointHistories: PointEntity = .init(goodPoint: 0, badPoint: 0, pointHistories: [])

    private let fetchPointHistoryUseCase: FetchPointHistoryUseCase

    init(fetchPointHistoryUseCase: FetchPointHistoryUseCase) {
        self.fetchPointHistoryUseCase = fetchPointHistoryUseCase
    }

    private var disposeBag = DisposeBag()

    func fetchPointHistory() {
        self.fetchPointHistoryUseCase.excute(type: type)
            .subscribe(onNext: {
                self.pointHistories = $0
            })
            .disposed(by: disposeBag)
    }

}
