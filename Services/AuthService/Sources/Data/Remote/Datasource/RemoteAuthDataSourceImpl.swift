import Foundation

import Moya
import RxSwift
import RxMoya

class RemoteAuthDataSourceImpl: RemoteAuthDataSource {

    private let provider = MoyaProvider<AuthAPI>()

    func signin(request: SigninRequest) -> Single<SigninAndRefreshTokenResponse> {
        self.provider.rx.request(.signin(request: request))
            .map(SigninAndRefreshTokenResponse.self)
    }

    func signup(request: SignupRequest) -> Completable {
        self.provider.rx.request(.signup(request: request))
            .asCompletable()
    }

    func logout(accessToken: String) -> Completable {
        self.provider.rx.request(.logout(accessToken: accessToken))
            .asCompletable()
    }

    func refreshToken(refreshToken: String) -> Single<SigninAndRefreshTokenResponse> {
        self.provider.rx.request(.refreshToken(refreshToken: refreshToken))
            .map(SigninAndRefreshTokenResponse.self)
    }

}
