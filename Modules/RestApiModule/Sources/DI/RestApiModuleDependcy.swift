import Foundation

import AuthService

public struct RestApiModuleDependency<T: XquareAPI> {
    public let restRemoteDataSource: RestApiRemoteDataSource<T>
}

public extension RestApiModuleDependency {
    static func resolve() -> RestApiModuleDependency {

        let authServiceDependency = AuthServiceDependency.resolve()

        let restRemoteDataSource = RestApiRemoteDataSource<T>(
            checkIsTokenValidUseCase: authServiceDependency.checkIsTokenValidUseCase,
            refreshTokenUseCase: authServiceDependency.refreshTokenUseCase,
            jwtPlugin: authServiceDependency.jwtPlugin
        )

        return .init(restRemoteDataSource: restRemoteDataSource)
    }
}
