//
//  onChangeExampleView.swift
//  SwiftUI+Combine+Extension
//
//  Created by Anirudha Mahale on 10/08/22.
//

import SwiftUI

struct OnChangeExampleView: View {
  
  @State var value1: Double = 0.0
  @State var value2: Double = 0.0
  
  var body: some View {
    VStack {
      Group {
        Text("First Slider")
          .if(value1 > 0.5) { view in
            view.foregroundColor(Color.red)
          }
        
        Slider(value: $value1)
          .valueChanged(value: value1) { newValue in
            print(newValue)
          }
      }
      Spacer()
        .frame(height: 124)
      Group {
        Text("Second Slider")
          .if(value2 > 0.5) { view in
            view.foregroundColor(Color.green)
          }
        Slider(value: $value2.onChange(sliderValueChanged(_:)))
      }
    }
  }
  
  private func sliderValueChanged(_ value: Double) {
    print(value)
  }
}

struct onChangeExampleView_Previews: PreviewProvider {
  static var previews: some View {
    OnChangeExampleView()
  }
}
