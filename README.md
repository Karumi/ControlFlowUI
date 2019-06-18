# ControlFlowUI

A library that add control flow functionality to SwitUI, using the power of @functionBuilder and ViewBuilder.
When you get the following error message, check this library:
**❗Closure containing control flow statement cannot be used with function builder 'ViewBuilder'**

## Features

### Switch - Type-Casting Patterns

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

### If Let - Optional Binding

```swift
struct DogDetailView : View {
    @ObjectBinding
    var viewModel: DogDetailViewModel

    var body: some View {
        IfLet(viewModel.dog) { item in
            VStack {
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

## Requirements

- iOS 13+ / macOS 10.15+ / tvOS 13+, watchOS 6+
- Xcode 11+
- Swift 5.1+

## Installation

### XCode

1. File > Swift Packages > Add Package Dependency...
2. Choose Project you want to add ControlFlowUI
3. Paste repository URL https://github.com/Karumi/ControlFlowUI
4. Rules > Branch: Master

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/Karumi/ControlFlowUI.git", .branch("master"))
]
```
