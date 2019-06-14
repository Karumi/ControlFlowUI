import Foundation
import SwiftUI

struct SwitchValue<Value>: View {
    private let value: Value
    private let bodyBuilder: (Value) -> AnyView

    init(_ value: Value, @ViewByTypeBuilder builder: () -> [String: (Value) -> AnyView]) {
        self.value = value
        let typeKey = "\(type(of: value))"
        if let bodyBuilder = builder()[typeKey] {
            self.bodyBuilder = bodyBuilder
        } else {
            bodyBuilder = { _ in AnyView(EmptyView()) }
        }
    }

    var body: some View {
        return bodyBuilder(value)
    }
}

struct CaseIs<Value, Content: View> {
    let type: String
    let builder: (Value) -> Content
    var builderAny: (Any) -> AnyView {
        return { AnyView(self.builder($0 as! Value)) }
    }

    init(_ type: Value.Type, @ViewBuilder builder:  @escaping (Value) -> Content) {
        self.type = "\(type)"
        self.builder = builder
    }
}

@_functionBuilder
struct ViewByTypeBuilder {

    /// Builds an empty view from an block containing no statements, `{ }`.
    public static func buildBlock() -> [String: (Any) -> AnyView] {
        return [:]
    }

    /// Passes a single view written as a child view (e..g, `{ Text("Hello") }`) through
    /// unmodified.
    public static func buildBlock<Value, Content>(_ caseIs: CaseIs<Value, Content>) -> [String: (Any) -> AnyView] where Content : View {
        return [caseIs.type: caseIs.builderAny]
    }

    public static func buildBlock<V0, C0, V1, C1>(_ caseIs0: CaseIs<V0, C0>, _ caseIs1: CaseIs<V1, C1>) -> [String: (Any) -> AnyView] where C0 : View, C1 : View {
        return [caseIs0.type: caseIs0.builderAny, caseIs1.type: caseIs1.builderAny]
    }
}
