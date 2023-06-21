//
//  WeightPickerView.swift
//  LoveMyCapibara
//
//  Created by José Winny on 06/06/23.
//

import SwiftUI

struct WeightPickerView: View {
    @Binding var kg : Int
    @Binding var gram : Int
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Group {
                    Picker("kilogram", selection: $kg) {
                        ForEach(0..<101) {
                            Text("\($0)")
                        }
                    }
                    Picker("gram", selection: $gram) {
                        ForEach(0..<200) {
                            Text("\($0 % 10)").tag($0 % 10)
                        }
                    }
                    .overlay{
                        Text("kg")
                            .offset(x: 50)
                    }
                }
                .frame(width: geometry.size.width / 2 + 30)
                .labelsHidden()
                .fixedSize(horizontal: true, vertical: true)
                .frame(width: geometry.size.width / 2 , height: 160)
                .clipped()
                .pickerStyle(.wheel)
            }
            .overlay(Text(","))
        }
        .frame(height: 160)
        .mask(Rectangle())
    }
}
    struct WeightPickerView_Previews: PreviewProvider {
        static var previews: some View {
            WeightPickerView(kg: .constant(0), gram: .constant(100))
    }
}
