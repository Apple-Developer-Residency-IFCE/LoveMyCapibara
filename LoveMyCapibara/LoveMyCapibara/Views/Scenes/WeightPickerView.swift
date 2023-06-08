//
//  WeightPickerView.swift
//  LoveMyCapibara
//
//  Created by José Winny on 06/06/23.
//

import SwiftUI

struct WeightPickerView: View {
    @State var kg : Int = 100
    @State var gram : Int = 0
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Picker("kilogram", selection: $kg) {
                    ForEach(0..<200) {
                        Text("\($0%10)")
                    }
                }
//                .labelsHidden()
                .fixedSize(horizontal: true, vertical: true)
                .frame(width: geometry.size.width / 2, height: 160)
                .clipped()
                
                Picker("gram", selection: $gram) {
                    ForEach(0..<10) {
                        Text("\($0)")
                    }
                }
//                .labelsHidden()
                .fixedSize(horizontal: true, vertical: true)
                .frame(width: geometry.size.width / 2, height: 160)
                .clipped()
            }
            .pickerStyle(.wheel)
            .overlay{
                Text(",KG")
            }
        }
        .frame(height: 160)
        .mask(Rectangle())
    }
}
    struct WeightPickerView_Previews: PreviewProvider {
        static var previews: some View {
            List{
                DataPickerView()
                HStack {
                    Spacer()
                    Text("Testando")
                    Spacer()
                }
                WeightPickerView()
            }
    }
}
