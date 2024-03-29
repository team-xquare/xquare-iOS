import Foundation

import RxSwift

public class OfflineCacheUtil<T: Equatable> {

    private var fetchLocalData: (() -> Single<T>)!
    private var fetchRemoteData: (() -> Single<T>)!
    private var isStaticData: Bool!
    private var refreshLocalData: ((_ remoteData: T) -> Void)!

    public init() { }

    public func localData(fetchLocalData: @escaping () -> Single<T>) -> Self {
        self.fetchLocalData = fetchLocalData
        return self
    }

    public func remoteData(loadOnlyFirstTime: Bool = false, fetchRemoteData: @escaping () -> Single<T>) -> Self {
        self.fetchRemoteData = fetchRemoteData
        self.isStaticData = loadOnlyFirstTime
        return self
    }

    public func doOnNeedRefresh(refreshLocalData: @escaping (_ remoteData: T) -> Void) -> Self {
        self.refreshLocalData = refreshLocalData
        return self
    }

    public func createObservable() -> Observable<T> {
        let publishSubject = PublishSubject<T>()
        Task {
            do {
                let local = try await fetchLocalData().value
                publishSubject.onNext(local)
                if !isStaticData {
                    let remote = try await fetchRemoteData().value
                    if local != remote {
                        publishSubject.onNext(remote)
                        self.refreshLocalData(remote)
                    }
                }
                publishSubject.onCompleted()
            } catch {
                do {
                    let remote = try await fetchRemoteData().value
                    publishSubject.onNext(remote)
                    publishSubject.onCompleted()
                    self.refreshLocalData(remote)
                } catch {
                    publishSubject.onError(error)
                }
            }
        }
        return publishSubject.asObservable()
    }

}
