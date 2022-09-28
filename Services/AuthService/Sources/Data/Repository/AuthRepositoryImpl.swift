import Foundation

import Moya
import RxSwift

class AuthRepositoryImpl: AuthRepository {

    private let remoteAuthDataSource: RemoteAuthDataSource
    private let loaclTokenDataSource: LoaclTokenDataSource

    init(remoteAuthDataSource: RemoteAuthDataSource,
         loaclTokenDataSource: LoaclTokenDataSource) {
        self.remoteAuthDataSource = remoteAuthDataSource
        self.loaclTokenDataSource = loaclTokenDataSource
    }

    func signin(signinEntity: SigninEntity) -> Completable {
        self.remoteAuthDataSource.signin(request: signinEntity.toSigninRequest())
            .do(onSuccess: { [weak self] tokenResponse in
                self?.loaclTokenDataSource.registerAccessToken(tokenResponse.accessToken)
                self?.loaclTokenDataSource.registerRefreshToken(tokenResponse.refreshToken)
                self?.loaclTokenDataSource.registerExpiredAt(tokenResponse.expirationAt)
            }).catch { error in
                let moyaError = error as? MoyaError
                guard moyaError?.response?.statusCode != nil else { return .error(AuthServiceError.networkNotWorking) }
                return .error(AuthServiceError.failToSignin)
            }.asCompletable()
    }

    func signup(signupEntity: SignupEntity) -> Completable {
        self.remoteAuthDataSource.signup(request: signupEntity.toSignupRequest())
            .catch { [weak self] error in
                let moyaError = error as? MoyaError
                guard moyaError?.response?.statusCode != nil else { return .error(AuthServiceError.networkNotWorking) }
                guard let errorCode = self?.errorToStatusCode(error) else { return .error(error) }
                switch errorCode {
                case 409: return .error(AuthServiceError.duplicateId)
                default: return .error(error)
                }
            }
    }

    func refreshToken() -> Completable {
        guard let refershToken = self.loaclTokenDataSource.fetchRefreshToken() else {
            return Completable.error(AuthServiceError.noToken)
        }
        return self.remoteAuthDataSource.refreshToken(refreshToken: refershToken)
            .do(onSuccess: { [weak self] tokenResponse in
                self?.loaclTokenDataSource.registerAccessToken(tokenResponse.accessToken)
                self?.loaclTokenDataSource.registerRefreshToken(tokenResponse.refreshToken)
                self?.loaclTokenDataSource.registerExpiredAt(tokenResponse.expirationAt)
            }).catch { [weak self] error in
                let moyaError = error as? MoyaError
                guard moyaError?.response?.statusCode != nil else { return .error(AuthServiceError.networkNotWorking) }
                guard let errorCode = self?.errorToStatusCode(error) else { return .error(error) }
                switch errorCode {
                case 401: return .error(AuthServiceError.tokenExpired)
                default: return .error(error)
                }
            }.asCompletable()
    }

    func fetchAccessToken() throws -> String {
        guard let accessToken = self.loaclTokenDataSource.fetchAccessToken() else {
            throw AuthServiceError.noToken
        }
        return accessToken
    }

    func fetchTokenExpiredDate() throws -> Date {
        guard let expiredDate = self.loaclTokenDataSource.fetchExpiredDate() else {
            throw AuthServiceError.noToken
        }
        return expiredDate
    }

}

extension AuthRepositoryImpl {

    private func errorToStatusCode(_ error: Error) -> Int? {
        guard let statusCode = (error as? MoyaError)?.response?.statusCode else {
            return nil
        }
        return statusCode
    }

}
