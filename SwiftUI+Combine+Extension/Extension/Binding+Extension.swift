//
//  Binding+Extension.swift
//  SwiftUI+Combine+Extension
//
//  Created by Anirudha Mahale on 10/08/22.
//

import Combine
import SwiftUI

extension Binding {
  /// Used to observe the value changes on a Binder
  func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
    Binding(
      get: { self.wrappedValue },
      set: { newValue in
        self.wrappedValue = newValue
        handler(newValue)
      }
    )
  }
}
