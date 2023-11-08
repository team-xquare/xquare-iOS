import Foundation

import RxSwift

protocol RemoteAuthDataSource {
    func signin(request: SigninRequest) -> Single<SigninAndRefreshTokenResponse>
    func signup(request: SignupRequest) -> Completable
    func logout(accessToken: String) -> Completable
    func refreshToken(refreshToken: String) -> Single<SigninAndRefreshTokenResponse>
}
