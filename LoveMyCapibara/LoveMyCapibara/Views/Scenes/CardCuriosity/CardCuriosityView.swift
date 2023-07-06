//
//  CardCuriosityView.swift
//  LoveMyCapibara
//
//  Created by Ravi on 05/07/23.
//

import SwiftUI

struct CardCuriosityView: View {
    
    @State var morph = false
    @State var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image("imgCuriosity")
                    .resizable()
                    .cornerRadius(14)
                    .frame(width: morph ? 84 : 20, height: morph ? 200 : 200, alignment: .leading)
                    .animation(.spring(dampingFraction: 2), value: morph)
                VStack(alignment: .leading) {
                    Text("Curiosidade do dia!")
                        .font(.system(size: 18, weight: .bold))
                        .padding(2)
                        .padding(.trailing, 4)
                        .foregroundColor(Color("PrimaryColor"))
                    ScrollView {
                        Text(text)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .animation(.spring(dampingFraction: 1), value: morph)
                            .padding(.horizontal, 4)
                        
                    }
                    .frame(height: 140)
                    .padding(.trailing, -2)
                }
            }
        }
        .clipped()
        .overlay(content: {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 2)
                .foregroundColor(Color(uiColor: .systemGray3))
        })
        .onAppear {
            morph = true
        }
    }
}

struct CardCuriosityView_Previews: PreviewProvider {
    static var previews: some View {
        CardCuriosityView(text: "ply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard .")
    }
}
