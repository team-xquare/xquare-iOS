import Foundation

public struct UserServiceDependency {

    public static let shared = Self.resolve()

    public let fetchUserInformationByIdUseCase: FetchUserInformationByIdUseCase
    public let fetchUserInformationByNameUseCase: FetchUserInformationByNameUseCase
    public let fetchUserListByClassUseCase: FetchUserListByClassUseCase
    public let fetchFCMTokenUseCase: FetchFCMTokenUseCase
    public let fetchExcludedUserListUseCase: FetchExcludedUserListUseCase
    public let fetchUserSimpleInformationUseCase: FetchUserSimpleInformationUseCase

}

extension UserServiceDependency {
    static func resolve() -> UserServiceDependency {

        let remoteDataSource = RemoteUserDataSourceImpl()

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

        let fetchUserPointUseCase = FetchUserSimpleInformationUseCase(
            repository: userRepository
        )

        return UserServiceDependency(
            fetchUserInformationByIdUseCase: fetchUserInformationByIdUseCase,
            fetchUserInformationByNameUseCase: fetchUserInformationByNameUseCase,
            fetchUserListByClassUseCase: fetchUserListByClassUseCase,
            fetchFCMTokenUseCase: fetchFCMTokenUseCase,
            fetchExcludedUserListUseCase: fetchExcludedUserListUseCase,
            fetchUserSimpleInformationUseCase: fetchUserPointUseCase
        )
    }
}
