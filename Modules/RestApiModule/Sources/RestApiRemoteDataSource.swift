import Foundation

import Moya
import RxMoya
import RxSwift
import AuthService

open class RestApiRemoteDataSource<API: XquareAPI> {

    private let checkIsTokenValidUseCase: CheckIsTokenValidUseCase
    private let refreshTokenUseCase: RefreshTokenUseCase
    private let jwtPlugin: JWTPlugin

    private lazy var provider = MoyaProvider<API>(plugins: [self.jwtPlugin])

    public init(authServiceDependency: AuthServiceDependency) {
        self.checkIsTokenValidUseCase = authServiceDependency.checkIsTokenValidUseCase
        self.refreshTokenUseCase = authServiceDependency.refreshTokenUseCase
        self.jwtPlugin = authServiceDependency.jwtPlugin
    }

    public func request(_ api: API) -> Single<Response> {
        return Single<Response>.create { single in
            var disposabels = [Disposable]()
            if self.checkApiIsNeedAccessToken(api) {
                disposabels.append(
                    self.requestWithAccessToken(api).subscribe(
                            onSuccess: { single(.success($0)) },
                            onFailure: { single(.failure($0)) })
                )
            } else {
                disposabels.append(
                    self.defaultRequest(api).subscribe(
                        onSuccess: { single(.success($0)) },
                        onFailure: { single(.failure($0)) })
                )
            }
            return Disposables.create(disposabels)
        }
    }

}

private extension RestApiRemoteDataSource {

    private func defaultRequest(_ api: API) -> Single<Response> {
        return provider.rx.request(api)
            .timeout(.seconds(5), scheduler: MainScheduler.asyncInstance)
            .catch { error in
                guard let errorCode = (error as? MoyaError)?.response?.statusCode else {
                    return Single.error(error)
                }
                return Single.error(api.errorMapper?[errorCode] ?? error)
            }
    }

    private func requestWithAccessToken(_ api: API) -> Single<Response> {
        return Single.deferred {
            if try self.checkTokenIsValid() {
                return self.defaultRequest(api)
            } else {
                return .error(AuthServiceError.tokenExpired)
            }
        }.retry(when: { (errorObservable: Observable<AuthServiceError>) in
            return errorObservable.flatMap { error -> Observable<Void> in
                if error == .tokenExpired {
                    return self.refreshToken().andThen(.just(()))
                } else {
                    return .error(error)
                }
            }
        })
    }

}

extension RestApiRemoteDataSource {

    private func checkApiIsNeedAccessToken(_ api: API) -> Bool {
        return api.jwtTokenType == JWTTokenType.accessToken
    }

    private func checkTokenIsValid() throws -> Bool {
        try self.checkIsTokenValidUseCase.excute()
    }

    private func refreshToken() -> Completable {
        self.refreshTokenUseCase.excute()
    }

}
