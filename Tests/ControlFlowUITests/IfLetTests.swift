import XCTest
import SwiftUI
@testable import ControlFlowUI

final class IfLetTests: XCTestCase {
    func testIfLetValueNotNil() {
        let spy: Spy? = Spy()
        let ifLet = IfLet(spy) { value in
            Text(value.name)
        }

        // Call View
        let _ = ifLet.body

        XCTAssertEqual(spy!.called, 1)
    }

    func testIfLetValueNil() {
        let spy: Spy? = nil
        let ifLet = IfLet(spy) { value in
            Text(value.name)
        }

        // Call View
        let _ = ifLet.body

        XCTAssertNil(spy)
    }

    static var allTests = [
        ("testIfLetValueNotNil", testIfLetValueNotNil),
        ("testIfLetValueNil", testIfLetValueNil),
    ]
}

private class Spy {
    var called: Int = 0

    var name: String {
        called += 1
        return "007"
    }
}
