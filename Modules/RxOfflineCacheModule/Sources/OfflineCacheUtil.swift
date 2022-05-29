import Foundation

import RxSwift

class OfflineCacheUtil<T: Equatable> {

    private var fetchLocalData: (() -> Single<T>)!
    private var fetchRemoteData: (() -> Single<T>)!
    private var isNeedRefresh: (_ localData: T, _ remoteData: T) -> Bool = { $0 != $1 }
    private var refreshLocalData: ((_ remoteData: T) -> Void)!

    func localData(fetchLocalData: @escaping () -> Single<T>) -> Self {
        self.fetchLocalData = fetchLocalData
        return self
    }

    func remoteData(fetchRemoteData: @escaping () -> Single<T>) -> Self {
        self.fetchRemoteData = fetchRemoteData
        return self
    }

    func compareData(isNeedRefresh: @escaping (_ localData: T, _ remoteData: T) -> Bool) -> Self {
        self.isNeedRefresh = isNeedRefresh
        return self
    }

    func doOnNeedRefresh(refreshLocalData: @escaping (_ remoteData: T) -> Void) -> Self {
        self.refreshLocalData = refreshLocalData
        return self
    }

    func createObservable() -> Observable<T> {
        let local = fetchLocalData()
            .asObservable()
            .map { Optional($0) }
            .catchAndReturn(nil)
        let remote = fetchRemoteData()
            .asObservable()
            .map { Optional($0) }
        return local
            .concat(remote)
            .enumerated()
            .scan(into: (index: -1, element: nil)) { (prevValue, newValue) in
                if prevValue.index != -1 {
                    if prevValue.element == nil || self.isNeedRefresh(prevValue.element!, newValue.element!) {
                        self.refreshLocalData(newValue.element!)
                        prevValue = newValue
                    }
                } else {
                    prevValue = newValue
                }
            }
            .map { $0.element }
            .compactMap { $0 }
    }

}
