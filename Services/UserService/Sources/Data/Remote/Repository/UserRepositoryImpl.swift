import Foundation

import RxSwift

public class UserRepositoryImpl: UserRepository {

    let remoteDataSource: RemoteUserDataSource

    init(
        remoteDataSource: RemoteUserDataSource
    ) {
        self.remoteDataSource = remoteDataSource
    }

    public func fetchUserInformationById(userId: String) -> Single<UserEntity> {
        return remoteDataSource.fetchUserInformationById(userId: userId)
    }

    public func fetchUserInformationByName(accountId: String) -> Single<UserEntity> {
        return remoteDataSource.fetchUserInformationByName(accountId: accountId)
    }

    public func fetchUserListByClass(
        grade: Int,
        classNumber: Int
    ) -> Observable<[ClassUserEntity]> {
        return remoteDataSource.fetchUserListByClass(
            grade: grade,
            classNumber: classNumber
        )
        .asObservable()
    }

    public func fetchFCMToken(users: [String]) -> Single<FCMTokensEntity> {
        return remoteDataSource.fetchFCMToken(users: users)
    }

    public func fetchExcludedUserList(users: [String]) -> Single<UserIdsEntity> {
        return remoteDataSource.fetchExcludedUserList(users: users)
    }

    public func fetchUserPoint(users: [String]) -> Single<UserPointEntity> {
        return remoteDataSource.fetchUserPoint(users: users)
    }

}