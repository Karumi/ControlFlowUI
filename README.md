# ControlFlowUI

Add Control Flow Functionalities to Swift UI.

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
