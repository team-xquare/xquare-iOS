import Foundation

import RxSwift

public class OfflineCacheUtil<T: Equatable> {

    private var fetchLocalData: (() -> Single<T>)!
    private var fetchRemoteData: (() -> Single<T>)!
    private var refreshLocalData: ((_ remoteData: T) -> Void)!

    public init() { }

    public func localData(fetchLocalData: @escaping () -> Single<T>) -> Self {
        self.fetchLocalData = fetchLocalData
        return self
    }

    public func remoteData(fetchRemoteData: @escaping () -> Single<T>) -> Self {
        self.fetchRemoteData = fetchRemoteData
        return self
    }

    public func doOnNeedRefresh(refreshLocalData: @escaping (_ remoteData: T) -> Void) -> Self {
        self.refreshLocalData = refreshLocalData
        return self
    }

    public func createObservable() -> Observable<T> {
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
            .scan((index: -1, element: nil)) { lastState, newValue in
                guard lastState.index != -1 else { return newValue }
                if lastState.element == nil || lastState.element! != newValue.element! {
                    self.refreshLocalData(newValue.element!)
                    return newValue
                } else {
                    return (newValue.index, nil)
                }
            }
            .map { $0.element }
            .compactMap { $0 }
    }

}
