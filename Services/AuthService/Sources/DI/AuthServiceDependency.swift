import Foundation

public struct AuthServiceDependency {
    public let checkIsTokenValidUseCase: CheckIsTokenValidUseCase
    public let refreshTokenUseCase: RefreshTokenUseCase
    public let signinUseCase: SigninUseCase
    public let signupUseCase: SignupUseCase
}

public extension AuthServiceDependency {
    static func resolve() -> AuthServiceDependency {
        // MARK: - Datasources
        let remoteAuthDataSource: RemoteAuthDataSource = RemoteAuthDataSourceImpl()
        let loaclTokenDataSource: LoaclTokenDataSource = LoaclTokenDataSourceImpl()

        // MARK: - Respositories
        let authRepository: AuthRepository = AuthRepositoryImpl(
            remoteAuthDataSource: remoteAuthDataSource,
            loaclTokenDataSource: loaclTokenDataSource
        )

        // MARK: - UseCases
        let checkIsTokenValidUseCase = CheckIsTokenValidUseCase(
            authRepository: authRepository
        )
        let refreshTokenUseCase = RefreshTokenUseCase(
            authRepository: authRepository
        )
        let signinUseCase = SigninUseCase(
            authRepository: authRepository
        )
        let signupUseCase = SignupUseCase(
            authRepository: authRepository
        )

        return AuthServiceDependency(
            checkIsTokenValidUseCase: checkIsTokenValidUseCase,
            refreshTokenUseCase: refreshTokenUseCase,
            signinUseCase: signinUseCase,
            signupUseCase: signupUseCase
        )
    }
}
