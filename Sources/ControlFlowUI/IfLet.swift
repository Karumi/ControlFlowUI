import SwiftUI

public struct IfLet<Value, Content: View>: View {
    let value: Value?
    let builder: (Value) -> Content

    public init(_ value: Value?, @ViewBuilder builder: @escaping (Value) -> Content) {
        self.value = value
        self.builder = builder
    }

    public var body: AnyView {
        if let value = value {
            return AnyView(builder(value))
        } else {
            return AnyView(EmptyView())
        }
    }
}
