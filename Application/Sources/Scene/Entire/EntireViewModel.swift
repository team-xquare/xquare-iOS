import Foundation

import AuthService
import RxSwift

class EntireViewModel: ObservableObject {
    @Published var showLogoutAlert: Bool = false
    @Published var isDidLogout: Bool = false

    private let logoutUseCase: LogoutUseCase
    private var disposeBag = DisposeBag()

    init(logoutUseCase: LogoutUseCase) {
        self.logoutUseCase = logoutUseCase
    }

    func logout() {
        self.logoutUseCase.excute()
            .subscribe(onCompleted: {
                self.isDidLogout = true
            })
            .disposed(by: disposeBag)
    }
}
