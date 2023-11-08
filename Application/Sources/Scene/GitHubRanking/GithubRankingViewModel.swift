import Foundation
import RxSwift
import GithubService

class GithubRankingViewModel: ObservableObject {

    private var disposeBag = DisposeBag()

    @Published var githubRankList: [GithubRankEntity] = []
    @Published var myGithubRank: GithubRankEntity?
    @Published var isLoading: Bool = false

    let fetchMyGithubInfoUseCase: FetchMyGithubInfoUseCase
    let fetchGithubInfoListUseCase: FetchGithubInfoListUseCase
    let updateGithubRankingUseCase: UpdateGithubRankingUseCase

    init(
        fetchMyGithubInfoUseCase: FetchMyGithubInfoUseCase,
        fetchGithubInfoListUseCase: FetchGithubInfoListUseCase,
        updateGithubRankingUseCase: UpdateGithubRankingUseCase
    ) {
        self.fetchMyGithubInfoUseCase = fetchMyGithubInfoUseCase
        self.fetchGithubInfoListUseCase = fetchGithubInfoListUseCase
        self.updateGithubRankingUseCase = updateGithubRankingUseCase
    }

    private func fetchGithubInfoList() {
        self.fetchGithubInfoListUseCase.execute()
            .subscribe(onNext: {
                self.isLoading = false
                self.githubRankList = $0.users.sorted(by: { first, last in
                    first.ranking < last.ranking
                })
            })
            .disposed(by: disposeBag)
    }

    private func fetchMyGithubInfo() {
        self.fetchMyGithubInfoUseCase.execute()
            .subscribe(onNext: {
                self.isLoading = false
                self.myGithubRank = $0
            })
            .disposed(by: disposeBag)
    }

    func updateGithubRanking() {
        self.updateGithubRankingUseCase.execute()
            .subscribe(onCompleted: {
                self.fetchMyGithubInfo()
                self.fetchGithubInfoList()
            })
            .disposed(by: disposeBag)
    }
}
