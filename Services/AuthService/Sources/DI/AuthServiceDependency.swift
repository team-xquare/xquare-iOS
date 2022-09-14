import Foundation

public struct AuthServiceDependency {
    public let checkIsTokenValidUseCase: CheckIsTokenValidUseCase
    public let fetchAccessTokenUseCase: FetchAccessTokenUseCase
    public let refreshTokenUseCase: RefreshTokenUseCase
    public let signinUseCase: SigninUseCase
    public let signupUseCase: SignupUseCase
    public let jwtPlugin: JWTPlugin
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
        let fetchAccessTokenUseCase = FetchAccessTokenUseCase(
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

        // MARK: - Plugin
        let jwtPlugin = JWTPlugin(
            loaclTokenDataSource: loaclTokenDataSource
        )

        return AuthServiceDependency(
            checkIsTokenValidUseCase: checkIsTokenValidUseCase,
            fetchAccessTokenUseCase: fetchAccessTokenUseCase,
            refreshTokenUseCase: refreshTokenUseCase,
            signinUseCase: signinUseCase,
            signupUseCase: signupUseCase,
            jwtPlugin: jwtPlugin
        )
    }
}
