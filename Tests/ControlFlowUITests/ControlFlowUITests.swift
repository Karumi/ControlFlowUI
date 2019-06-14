import XCTest
import SwiftUI
@testable import ControlFlowUI

final class CaseIsTests: XCTestCase {
    func testCaseIsBuilder() {
        let caseIs = CaseIs(Int.self) { int in
            Text(int.description)
        }

        let expectedValue = 42
        XCTAssertEqual(caseIs.builder(expectedValue), Text(expectedValue.description))
    }

    static var allTests = [
        ("testCaseIsBuilder", testCaseIsBuilder),
    ]
}
