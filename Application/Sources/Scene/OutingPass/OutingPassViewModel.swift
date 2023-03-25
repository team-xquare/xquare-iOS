import SwiftUI

import RxSwift
import PickService

class OutingPassViewModel: ObservableObject {
    @Published var outingPassData: OutingPassEntity?

    private let fetchOutingPassUseCase: FetchOutingPassUseCase

    init(fetchOutingPassUseCase: FetchOutingPassUseCase) {
        self.fetchOutingPassUseCase = fetchOutingPassUseCase
    }

    private var disposeBag = DisposeBag()

    func fetchOutingPass() {
        self.fetchOutingPassUseCase.excute()
            .subscribe(onNext: {
                self.outingPassData = $0
            })
            .disposed(by: disposeBag)
    }
}
