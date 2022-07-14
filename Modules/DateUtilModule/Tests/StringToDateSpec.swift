import Foundation
import Quick
import Nimble

@testable import DateUtilModule

class StringToDateSpec: QuickSpec {

    var mockDateString: String!
    var convertedDate: Date!

    override func spec() {
        describe("특정 DateString을") {
            beforeEach {
                self.mockDateString = "2022-07-14"
            }
            context("Date로 바꿀 때") {
                beforeEach {
                    self.convertedDate = self.mockDateString.toDate(format: .fullDate)
                }
                it("데이터 누락 없이 변환 되어야 한다.") {
                    expect(Calendar.current.dateComponents([.year], from: self.convertedDate).year) == 2022
                    expect(Calendar.current.dateComponents([.month], from: self.convertedDate).month) == 7
                    expect(Calendar.current.dateComponents([.day], from: self.convertedDate).day) == 14
                }
            }
        }
    }

}
