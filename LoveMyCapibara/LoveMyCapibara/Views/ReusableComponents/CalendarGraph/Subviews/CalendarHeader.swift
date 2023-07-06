//
//  CalendarHeader.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 06/07/23.
//

import SwiftUI

struct CalendarHeader: View {
    @ObservedObject var viewModel: CalendarViewModel
    
    var body: some View {
        HStack {
            Button {
                viewModel.selectForwardYear()
            } label: {
                Image("LeftArrow")
                    .resizable()
                    .frame(width: 7, height: 12)
                
            }
            .buttonStyle(.plain)
            .padding(.leading, 10)
            
            Text("\(viewModel.titleForMonth()) \(viewModel.titleForYear())")
                .font(.system(size: 20, weight: .semibold))
            
            Button {
                viewModel.selectForwardYear()
            } label: {
                Image("RightArrow")
                    .resizable()
                    .frame(width: 7, height: 12)
                
            }
            .buttonStyle(.plain)
            .padding(.trailing, 10)
            
            Spacer()
            
            HStack {
                Button {
                    viewModel.selectBackMonth()
                } label: {
                    Image("LeftArrow")
                        .frame(width: 30, height: 30)
                }
                .buttonStyle(.plain)
                .padding(.leading, 10)
                
                Button {
                    viewModel.selectForwardMonth()
                } label: {
                    Image("RightArrow")
                        .frame(width: 30, height: 30)
                }
                .buttonStyle(.plain)
                .padding(.trailing, 10)
            }
        }
    }
}

//struct CalendarHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarHeader()
//    }
//}
