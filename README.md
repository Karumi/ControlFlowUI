# ControlFlowUI

**❗Closure containing control flow statement cannot be used with function builder 'ViewBuilder'**

Add Control Flow Functionalities to SwiftUI.

## Switch - Type-Casting Patterns

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

## If Let - Optional Binding

```swift
struct DogDetailView : View {
    @ObjectBinding
    var viewModel: DogDetailViewModel

    var body: some View {
        IfLet(viewModel.dog) { item in
            Group {
                Text(item.name).color(.white).padding()
                Text(item.description).color(.white).lineLimit(nil).padding()
                Spacer()
            }
        }
        .onAppear {
            self.viewModel.load()
        }
    }
}
```