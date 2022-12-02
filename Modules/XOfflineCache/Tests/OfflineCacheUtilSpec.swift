import Quick
import Nimble
import RxBlocking
import RxNimble
import RxSwift

import XOfflineCache

class OfflineCacheUtilSpec: QuickSpec {

    var localData: String!
    var offlineCacheUtil = OfflineCacheUtil<String>()

    override func spec() {
        describe("데이터를 불러올때") {

            beforeEach {
                self.localData = nil
            }

            context("로컬 데이터에서 오류가 발생한다면") {
                beforeEach {
                    _ = self.offlineCacheUtil
                        .localData { Single.error(RxError.unknown) }
                        .remoteData { Single.just("data") }
                        .doOnNeedRefresh { self.localData = $0 }
                }
                it("리모트 데이터를 내보내야한다.") {
                    expect(self.offlineCacheUtil.createObservable()).array == ["data"]
                }
                it("새 데이터를 로컬에 저장해야 한다.") {
                    _ = self.offlineCacheUtil.createObservable().toBlocking().materialize()
                    expect(self.localData) == "data"
                }
            }

            context("리모트 테이터가 로컬 데이터와 같다면") {
                beforeEach {
                    _ = self.offlineCacheUtil
                        .localData { Single.just("data") }
                        .remoteData { Single.just("data") }
                        .doOnNeedRefresh { self.localData = $0 }
                }
                it("처음에 내보낸 로컬 데이터 외에 데이터를 보내지 않아야한다.") {
                    expect(self.offlineCacheUtil.createObservable()).array == ["data"]
                }
            }

            context("리모트 테이터가 로컬 데이터와 다르다면") {
                beforeEach {
                    _ = self.offlineCacheUtil
                        .localData { Single.just("data") }
                        .remoteData { Single.just("datadata") }
                        .doOnNeedRefresh { self.localData = $0 }
                }
                it("로컬 데이터를 내보낸 이후에 로드된 리모트 데이터를 한번 더 내보내야한다.") {
                    expect(self.offlineCacheUtil.createObservable()).array == ["data", "datadata"]
                }
                it("새 데이터를 로컬에 저장해야 한다.") {
                    _ = self.offlineCacheUtil.createObservable().toBlocking().materialize()
                    expect(self.localData) == "datadata"
                }
            }

        }
    }

}
