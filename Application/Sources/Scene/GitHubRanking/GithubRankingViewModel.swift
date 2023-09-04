import Foundation
import RxSwift
import GithubService

class GithubRankingViewModel: ObservableObject {

    private var disposeBag = DisposeBag()

    @Published var githubRankList: [GithubRankEntity] = []
    @Published var myGithubRank: GithubRankEntity?

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

    func fetchGithubInfoList() {
        self.fetchGithubInfoListUseCase.execute()
            .subscribe(onNext: {
                self.githubRankList = $0.users.sorted(by: { first, last in
                    first.ranking < last.ranking
                })
            })
            .disposed(by: disposeBag)
    }

    func fetchMyGithubInfo() {
        self.fetchMyGithubInfoUseCase.execute()
            .subscribe(onNext: {
                self.myGithubRank = $0
            })
            .disposed(by: disposeBag)
    }

    func updateGithubRanking() {
        self.updateGithubRankingUseCase.execute()
            .subscribe(onCompleted: {})
            .disposed(by: disposeBag)
    }
}
