# ControlFlowUI

**❗Closure containing control flow statement cannot be used with function builder 'ViewBuilder'**

Add Control Flow Functionalities to SwiftUI.

```swift
List(dogs.identified(by: \.name)) { dog in
    SwitchValue(dog) {
        CaseIs(Animal.self) { value in
            Text(value.species)
        }
        CaseIs(Dog.self) { value in
            Text(value.breed)
        }
    }
}
```
