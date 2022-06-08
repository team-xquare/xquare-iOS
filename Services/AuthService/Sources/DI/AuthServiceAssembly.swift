import Foundation

import Swinject

public class AuthServiceAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        self.registerDatasource(container: container)
        self.registerRespository(container: container)
        self.registerUseCase(container: container)
        self.registerPlugin(container: container)
    }
}

extension AuthServiceAssembly {

    private func registerDatasource(container: Container) {
        container.register(RemoteAuthDataSource.self) { _ in RemoteAuthDataSourceImpl() }
        container.register(LoaclTokenDataSource.self) { _ in LoaclTokenDataSourceImpl() }
    }

    private func registerRespository(container: Container) {
        container.register(AuthRepository.self) { resolver in
            AuthRepositoryImpl(
                remoteAuthDataSource: resolver.resolve(RemoteAuthDataSource.self)!,
                loaclTokenDataSource: resolver.resolve(LoaclTokenDataSource.self)!
            )
        }
    }

    private func registerUseCase(container: Container) {
        container.register(CheckIsTokenValidUseCase.self) { resolver in
            CheckIsTokenValidUseCase(
                authRepository: resolver.resolve(AuthRepository.self)!
            )
        }
        container.register(RefreshTokenUseCase.self) { resolver in
            RefreshTokenUseCase(
                authRepository: resolver.resolve(AuthRepository.self)!
            )
        }
        container.register(SigninUseCase.self) { resolver in
            SigninUseCase(
                authRepository: resolver.resolve(AuthRepository.self)!
            )
        }
        container.register(SignupUseCase.self) { resolver in
            SignupUseCase(
                authRepository: resolver.resolve(AuthRepository.self)!
            )
        }
    }

    private func registerPlugin(container: Container) {
        container.register(JWTPlugin.self) { resolver in
            JWTPlugin(
                loaclTokenDataSource: resolver.resolve(LoaclTokenDataSource.self)!
            )
        }
    }

}
