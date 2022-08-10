//
//  View+Extension.swift
//  SwiftUI+Combine+Extension
//
//  Created by Anirudha Mahale on 10/08/22.
//

import SwiftUI
import Combine

extension View {
  /// A backwards compatible wrapper for iOS 14 `onChange`
  /// https://betterprogramming.pub/implementing-swiftui-onchange-support-for-ios13-577f9c086c9
  @ViewBuilder func valueChanged<T: Equatable>(value: T, onChange: @escaping (T) -> Void) -> some View {
    if #available(iOS 14.0, *) {
      self.onChange(of: value, perform: onChange)
    } else {
      self.onReceive(Just(value)) { (value) in
        onChange(value)
      }
    }
  }
  
  /// Applies the given transform if the given condition evaluates to `true`.
  /// - Parameters:
  ///   - condition: The condition to evaluate.
  ///   - transform: The transform to apply to the source `View`.
  /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
  /// https://www.avanderlee.com/swiftui/conditional-view-modifier/
  @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }
}
