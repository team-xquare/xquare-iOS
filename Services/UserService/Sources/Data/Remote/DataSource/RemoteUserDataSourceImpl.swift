import Foundation

import Moya
import RxSwift
import RxMoya
import RestApiModule

class RemoteUserDataSourceImpl: RestApiRemoteDataSource<UserAPI>, RemoteUserDataSource {

    func fetchUserInformationById(userId: String) -> Single<UserEntity> {
        return request(.fetchUserInformationById(userId: userId))
            .map(UserResponse.self)
            .map { $0.toDomain() }
    }

    func fetchUserInformationByName(accountId: String) -> Single<UserEntity> {
        return request(.fetchUserInformationByName(accountId: accountId))
            .map(UserResponse.self)
            .map { $0.toDomain() }
    }

    func fetchUserListByClass(
        grade: Int,
        classNumber: Int
    ) -> Single<[ClassUserEntity]> {
        return request(.fetchUserListByClass(
            grade: grade,
            classNumber: classNumber
        ))
        .map(ClassUserListResponse.self)
        .map { $0.toDomain() }
    }

    func fetchFCMToken(users: [String]) -> Single<FCMTokensEntity> {
        return request(.fetchFCMToken(users: users))
            .map(FCMTokenResponse.self)
            .map { $0.toDomain() }
    }

    func fetchExcludedUserList(users: [String]) -> Single<UserIdsEntity> {
        return request(.fetchExcludedUserList(users: users))
            .map(UserIdsResponse.self)
            .map { $0.toDomain() }
    }

    func fetchUserPoint(users: [String]) -> Single<UserPointEntity> {
        return request(.fetchUserPoint(users: users))
            .map(UserPointResponse.self)
            .map { $0.toDomain() }
    }
}