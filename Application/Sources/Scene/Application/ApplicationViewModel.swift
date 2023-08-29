import Foundation

import AuthService
import RxSwift

class ApplicationViewModel: ObservableObject {

    private let fetchAccessTokenUseCase: FetchAccessTokenUseCase
    private let refreshTokenIfExpiredUseCase: RefreshTokenIfExpiredUseCase

    private let disposeBag = DisposeBag()

    private let webviewURLString: String = "https://prod-server.xquare.app/apply"

    init(
        fetchAccessTokenUseCase: FetchAccessTokenUseCase,
        refreshTokenIfExpiredUseCase: RefreshTokenIfExpiredUseCase
    ) {
        self.fetchAccessTokenUseCase = fetchAccessTokenUseCase
        self.refreshTokenIfExpiredUseCase = refreshTokenIfExpiredUseCase
    }

    func getWebviewURLString() -> String {
        self.webviewURLString
    }

    func getAccessToken() -> String {
        do {
            return try self.fetchAccessTokenUseCase.excute()
        } catch {
            return ""
        }
    }

    func refreshTokenIfExpired() {
        self.refreshTokenIfExpiredUseCase.excute()
            .subscribe()
            .disposed(by: self.disposeBag)
    }

}
