import XCTest
import SwiftUI
@testable import ControlFlowUI

final class SwitchValueTests: XCTestCase {
    func testSwitchValueBodyDiferentTypes() {
        let fruitObject = Fruit()

        let switchValue = SwitchValue(fruitObject) {
            CaseIs(Fruit.self) { value in
                Text(value.season)
            }
            CaseIs(Animal.self) { value in
                Text(value.species)
            }
        }

        // Call View
        let _ = switchValue.body

        XCTAssertEqual(fruitObject.called, 1)
    }

    func testSwitchValueBodySubTypes() {
        let dogObject = Dog()

        let switchValue = SwitchValue(dogObject) {
            CaseIs(Animal.self) { value in
                Text(value.species)
            }
            CaseIs(Dog.self) { value in
                Text(value.breed)
            }
        }

        // Call View
        let _ = switchValue.body

        XCTAssertEqual(dogObject.breedCalled, 1)
    }

    static var allTests = [
        ("testSwitchValueBodyDiferentTypes", testSwitchValueBodyDiferentTypes),
        ("testSwitchValueBodySubTypes", testSwitchValueBodySubTypes),
    ]
}

private class Fruit {
    var called: Int = 0

    var season: String {
        called += 1
        return "Apple"
    }
}
private class Animal {
    var called: Int = 0
    var speciesCalled: Int = 0

    var species: String {
        called += 1
        return "Dog"
    }
}

private class Dog: Animal {
    var breedCalled: Int = 0

    var breed: String {
        breedCalled += 1
        return "Poodle"
    }
}
