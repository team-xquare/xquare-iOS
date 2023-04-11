import Foundation

import AuthService
import RxSwift

class LaunchScreenViewModel: ObservableObject {

    @Published var isSuccessToRefreshToken = false
    @Published var isFailureToRefreshToken = false

    private let refreshTokenUseCase: RefreshTokenUseCase

    private var disposeBag = DisposeBag()

    init(refreshTokenUseCase: RefreshTokenUseCase) {
        self.refreshTokenUseCase = refreshTokenUseCase
    }

    func refreshToken() {
        self.isSuccessToRefreshToken = false
        self.isFailureToRefreshToken = false
        self.refreshTokenUseCase.excute()
            .subscribe(onCompleted: {
                self.isSuccessToRefreshToken = true
            }, onError: { _ in
                self.isFailureToRefreshToken = true
            })
            .disposed(by: self.disposeBag)
    }

}
