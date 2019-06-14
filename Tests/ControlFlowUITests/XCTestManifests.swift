import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CaseIsTests.allTests),
        testCase(SwitchValueTests.allTests),
    ]
}
#endif
