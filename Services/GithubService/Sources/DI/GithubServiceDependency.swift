import Foundation

public struct GithubServiceDependency {
    public static let shared = Self.resolve()

    public let registerGithubIDUseCase: RegisterGithubIDUseCase
    public let fetchMyGithubInfoUseCase: FetchMyGithubInfoUseCase
    public let fetchGithubInfoListUseCase: FetchGithubInfoListUseCase
}

extension GithubServiceDependency {
    static func resolve() -> GithubServiceDependency {
        let remoteDataSource: RemoteGithubDataSource = RemoteGithubDataSourceImpl()

        let repository = GithubRepositoryImpl(remoteDataSource: remoteDataSource)

        let registerGithubIDUseCase = RegisterGithubIDUseCase(
            repository: repository
        )
        let fetchMyGithubInfoUseCase = FetchMyGithubInfoUseCase(
            repository: repository
        )
        let fetchGithubInfoListUseCase = FetchGithubInfoListUseCase(
            repository: repository
        )

        return .init(
            registerGithubIDUseCase: registerGithubIDUseCase,
            fetchMyGithubInfoUseCase: fetchMyGithubInfoUseCase,
            fetchGithubInfoListUseCase: fetchGithubInfoListUseCase
        )
    }
}
