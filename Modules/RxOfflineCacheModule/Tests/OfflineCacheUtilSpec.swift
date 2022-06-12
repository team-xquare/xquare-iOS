import Quick
import Nimble
import RxBlocking
import RxNimble
import RxSwift

@testable import RxOfflineCacheModule

class OfflineCacheUtilSpec: QuickSpec {

    var localData: String!
    var offlineCacheUtil = OfflineCacheUtil<String>()

    override func spec() {
        describe("데이터를 불러올때") {
            beforeEach {
                self.localData = "data"
                _ = self.offlineCacheUtil
                    .localData { Single.just(self.localData) }
                    .doOnNeedRefresh { self.localData = $0 }
            }
            context("리모트 테이터가 로컬 데이터와 같다면") {
                beforeEach {
                    _ = self.offlineCacheUtil
                        .remoteData { Single.just("data") }
                }
                it("처음에 내보낸 로컬 데이터 외에 데이터를 보내지 않아야한다.") {
                    expect(self.offlineCacheUtil.createObservable()).array == ["data"]
                }
            }
            context("리모트 테이터가 로컬 데이터와 다르다면") {
                beforeEach {
                    _ = self.offlineCacheUtil.remoteData { Single.just("datadata") }
                }
                it("로컬 데이터를 내보낸 이후에 로드된 리모트 데이터를 한번 더 내보내야한다.") {
                    expect(self.offlineCacheUtil.createObservable()).array == ["data", "datadata"]
                }
                it("새 데이터를 로컬에 저장할 수 있게끔 한다.") {
                    let remoteData = try self.offlineCacheUtil
                        .createObservable()
                        .toBlocking()
                        .last()!
                    expect(self.localData) == remoteData
                }
            }
        }
        it("CI Test") {
            expect(true) == false
        }
    }

}
