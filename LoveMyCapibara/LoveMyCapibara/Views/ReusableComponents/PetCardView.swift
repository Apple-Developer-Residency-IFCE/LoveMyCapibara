//
//  PetCardView.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct PetCardView: View {
    var body: some View {
        HStack(){
            Image(systemName: "star")
                .padding(.horizontal,16)
            VStack(alignment: .leading){
                Text("Pet Name")
                    .font(.title3)
                Text("Pet species")
                    .font(.subheadline)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.8,alignment: .leading)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1.4)
        )
    }
}

struct PetCardView_Previews: PreviewProvider {
    static var previews: some View {
        PetCardView()
    }
}
