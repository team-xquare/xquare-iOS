import Foundation

import RxSwift

public protocol AuthRepository {
    func signin(signinEntity: SigninEntity) -> Completable
    func signup(signupEntity: SignupEntity) -> Completable
    func refreshToken() -> Completable
    func fetchAccessToken() throws -> String
    func fetchTokenExpiredDate() throws -> Date
    func autoLogin() -> Single<IdAndPasswordEntity>
}
