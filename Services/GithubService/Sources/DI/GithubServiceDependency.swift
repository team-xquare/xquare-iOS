import Foundation

public struct GithubServiceDependency {
    public static let shared = Self.resolve()

    public let registerGithubIDUseCase: RegisterGithubIDUseCase
    public let fetchMyGithubInfoUseCase: FetchMyGithubInfoUseCase
    public let fetchGithubInfoListUseCase: FetchGithubInfoListUseCase
    public let updateGithubRankingUseCase: UpdateGithubRankingUseCase
    public let checkGithubConnecting: CheckGithubConnectingUseCase
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
        let updateGithubRankingUseCase = UpdateGithubRankingUseCase(
            repository: repository
        )
        let checkGithubConnectingUseCase = CheckGithubConnectingUseCase(
            repository: repository
        )

        return .init(
            registerGithubIDUseCase: registerGithubIDUseCase,
            fetchMyGithubInfoUseCase: fetchMyGithubInfoUseCase,
            fetchGithubInfoListUseCase: fetchGithubInfoListUseCase,
            updateGithubRankingUseCase: updateGithubRankingUseCase,
            checkGithubConnecting: checkGithubConnectingUseCase
        )
    }
}
