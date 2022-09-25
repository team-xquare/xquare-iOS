import Foundation

import AuthService

public struct UserServiceDependency {
    public let fetchUserInformationByIdUseCase: FetchUserInformationByIdUseCase
    public let fetchUserInformationByNameUseCase: FetchUserInformationByNameUseCase
    public let fetchUserListByClassUseCase: FetchUserListByClassUseCase
    public let fetchFCMTokenUseCase: FetchFCMTokenUseCase
    public let fetchExcludedUserListUseCase: FetchExcludedUserListUseCase
    public let fetchUserPointUseCase: FetchUserPointUseCase
}

public extension UserServiceDependency {
    static func resolve() -> UserServiceDependency {

        let authServiceDependency = AuthServiceDependency.resolve()

        let remoteDataSource = RemoteUserDataSourceImpl(
            checkIsTokenValidUseCase: authServiceDependency.checkIsTokenValidUseCase,
            refreshTokenUseCase: authServiceDependency.refreshTokenUseCase,
            jwtPlugin: authServiceDependency.jwtPlugin
        )

        let userRepository = UserRepositoryImpl(
            remoteDataSource: remoteDataSource
        )

        let fetchUserInformationByIdUseCase = FetchUserInformationByIdUseCase(
            repository: userRepository
        )

        let fetchUserInformationByNameUseCase = FetchUserInformationByNameUseCase(
            repository: userRepository
        )

        let fetchUserListByClassUseCase = FetchUserListByClassUseCase(
            repository: userRepository
        )

        let fetchFCMTokenUseCase = FetchFCMTokenUseCase(
            repository: userRepository
        )

        let fetchExcludedUserListUseCase = FetchExcludedUserListUseCase(
            repository: userRepository
        )

        let fetchUserPointUseCase = FetchUserPointUseCase(
            repository: userRepository
        )

        return UserServiceDependency(
            fetchUserInformationByIdUseCase: fetchUserInformationByIdUseCase,
            fetchUserInformationByNameUseCase: fetchUserInformationByNameUseCase,
            fetchUserListByClassUseCase: fetchUserListByClassUseCase,
            fetchFCMTokenUseCase: fetchFCMTokenUseCase,
            fetchExcludedUserListUseCase: fetchExcludedUserListUseCase,
            fetchUserPointUseCase: fetchUserPointUseCase
        )
    }
}
