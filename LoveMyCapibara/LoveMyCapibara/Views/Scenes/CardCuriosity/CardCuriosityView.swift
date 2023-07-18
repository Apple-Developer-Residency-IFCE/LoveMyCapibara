//
//  CardCuriosityView.swift
//  LoveMyCapibara
//
//  Created by Ravi on 05/07/23.
//

import SwiftUI

struct CardCuriosityView: View {
    
    @State var morph = false
    @State private var fact = Fact(fact: "", length: 0).fact
    
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
                        .font(FontManager.poppinsSemiBold(size: 18))
                        .padding(2)
                        .padding(.trailing, 4)
                        .foregroundColor(Color("PrimaryColor"))
                    ScrollView {
                        Text(fact.isEmpty ? "Carregando..." : fact)
                            .font(FontManager.poppinsRegular(size: 14))
                            .foregroundColor(Color("PrimaryText"))
                            .multilineTextAlignment(.leading)
                            .animation(.spring(dampingFraction: 1), value: morph)
                            .padding(.horizontal, 4)
                        
                    }
                    .frame(height: 123)
                    .padding(.trailing, -2)
                }
                Spacer()
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
            if fact.isEmpty {
                CatFactApi().newFact(maxLength: 120, completion: { fact in
                    self.fact = fact.fact
                })
            }
        }
    }
}

struct CardCuriosityView_Previews: PreviewProvider {
    static var previews: some View {
        CardCuriosityView()
    }
}
