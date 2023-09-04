import XCTest

@testable import SwiftAppHW1

final class DateHelperTests: XCTestCase {
    private var helper: DateHelper!
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
    }

    func testDrawDate() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MMMM-dd HH:mm:ss"
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        let date = dateFormatter.date(from: "2023-08-31 00:00:01")
        let dateString = DateHelper.drawDate(date: date)
        XCTAssertEqual(dateString, "31 августа 2023 г., 00:00:01", "Некорректный формат даты")
    }
}