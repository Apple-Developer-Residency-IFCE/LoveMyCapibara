//
//  AddPetView.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct AddPetView: View {
    @ObservedObject var formViewModel = FormViewModel()
    
    var body: some View {
        VStack{
            FormView()
                .environmentObject(formViewModel)
            
            Spacer()
        }
        .padding(.top)
    }
}

struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView()
    }
}
