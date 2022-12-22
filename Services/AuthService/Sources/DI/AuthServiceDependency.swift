import Foundation

public struct AuthServiceDependency {

    public static let shared = Self.resolve()

    public let checkIsTokenValidUseCase: CheckIsTokenValidUseCase
    public let fetchAccessTokenUseCase: FetchAccessTokenUseCase
    public let refreshTokenUseCase: RefreshTokenUseCase
    public let signinUseCase: SigninUseCase
    public let signupUseCase: SignupUseCase
    public let autoLoginUseCase: AutoLoginUseCase
    public let jwtPlugin: JWTPlugin

}

extension AuthServiceDependency {
    static func resolve() -> AuthServiceDependency {
        // MARK: - Datasources
        let remoteAuthDataSource: RemoteAuthDataSource = RemoteAuthDataSourceImpl()
        let loaclTokenDataSource: LoaclTokenDataSource = LoaclTokenDataSourceImpl()
        let localAuthDataSource: LocalAuthDataSource = LocalAuthDataSourceImpl()

        // MARK: - Respositories
        let authRepository: AuthRepository = AuthRepositoryImpl(
            remoteAuthDataSource: remoteAuthDataSource,
            loaclTokenDataSource: loaclTokenDataSource,
            localAuthDataSource: localAuthDataSource
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
        let fetchIdAndPasswordUsecase = AutoLoginUseCase(
            repository: authRepository
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
            autoLoginUseCase: fetchIdAndPasswordUsecase,
            jwtPlugin: jwtPlugin
        )
    }
}
