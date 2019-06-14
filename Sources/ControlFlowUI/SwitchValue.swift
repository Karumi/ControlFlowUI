import Foundation
import SwiftUI

public struct SwitchValue<Value>: View {
    let value: Value
    let bodyBuilder: (Value) -> AnyView

    public init(_ value: Value, @ViewByTypeBuilder builder: () -> [String: (Any) -> AnyView]) {
        self.value = value
        let typeKey = "\(type(of: value as Any))" // Trick to find dynamic type. See  https://developer.apple.com/documentation/swift/2885064-type
        if let bodyBuilder = builder()[typeKey] {
            self.bodyBuilder = bodyBuilder
        } else {
            bodyBuilder = { _ in AnyView(EmptyView()) }
        }
    }

    public var body: some View {
        return bodyBuilder(value)
    }
}

public struct CaseIs<Value, Content: View> {
    let type: String
    let builder: (Value) -> Content
    var builderAny: (Any) -> AnyView {
        return { AnyView(self.builder($0 as! Value)) }
    }

    public init(_ type: Value.Type, @ViewBuilder builder:  @escaping (Value) -> Content) {
        self.type = "\(type)"
        self.builder = builder
    }
}

@_functionBuilder
public struct ViewByTypeBuilder {
    public typealias Component = [String: (Any) -> AnyView]

    public static func buildBlock<V0, C0, V1, C1>(_ caseIs0: CaseIs<V0, C0>, _ caseIs1: CaseIs<V1, C1>) -> Component where C0 : View, C1 : View {
        return [caseIs0.type: caseIs0.builderAny, caseIs1.type: caseIs1.builderAny]
    }
}
