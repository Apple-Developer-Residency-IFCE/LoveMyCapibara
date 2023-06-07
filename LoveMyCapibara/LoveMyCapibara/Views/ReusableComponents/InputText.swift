//
//  InputText.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct InputText: View {
    var placeholder: String
    @Binding var value: String
    
    var body: some View {
        TextField(placeholder, text: $value)
        
    }
}

struct InputText_Previews: PreviewProvider {
    static var previews: some View {
        InputText(placeholder: "Nome do Pet" ,value: .constant(""))
    }
}
