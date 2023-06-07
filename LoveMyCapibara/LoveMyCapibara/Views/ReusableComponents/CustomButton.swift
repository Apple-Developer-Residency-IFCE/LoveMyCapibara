//
//  ExcludeButton.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 07/06/23.
//

import SwiftUI

struct CustomButton: View {
    
    var buttonLabel: String
    var buttonAction: () -> Void
    var buttonColor: String
    
    var body: some View {
        Button(buttonLabel){
            buttonAction()
            
        }
        .foregroundColor(Color("ButtonLabelColor"))
        .font(FontManager.poppinsBold(size: 16))
        .padding(EdgeInsets(top:15, leading: 98, bottom: 15, trailing: 98))
        .background(Color("DeleteButtonColor"))
        .cornerRadius(8)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(buttonLabel: "Excluir cadastro", buttonAction: { print("oi") },buttonColor: "DeleteButtonColor")
    }
}
