import Foundation
import Quick
import Nimble

import XDateUtil

class DateToStringSpec: QuickSpec {

    var mockDate: Date!

    override func spec() {
        describe("특정 Date를") {
            beforeEach {
                var dateComponents = DateComponents()
                dateComponents.year = 2022
                dateComponents.month = 7
                dateComponents.day = 14
                self.mockDate = Calendar.current.date(from: dateComponents)
            }
            context("String 값으로 바꿀 때") {
                it("지정된 Format으로 변환 되어야 한다.") {
                    expect(self.mockDate.toString(format: .fullDate)) == "2022-07-14"
                }
            }
        }
    }

}
