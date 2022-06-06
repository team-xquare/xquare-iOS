import Foundation

import RxSwift

protocol RemoteAuthDataSource {
    func signin(request: SigninRequest) -> Single<SigninAndRefreshTokenResponse>
    func signup(request: SignupRequest) -> Completable
    func refreshToken(refreshToken: String) -> Single<SigninAndRefreshTokenResponse>
}
