//
//  AddPetView.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct AddPetView: View {
    @ObservedObject var formViewModel = FormViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = AddPetViewModel()
    
    var body: some View {
        VStack{
            FormView()
                .environmentObject(formViewModel)
            Button(action: {
                viewModel.add(pet: formViewModel.pet)
                dismiss()
            }, label: {
                Text("Aperte aqui para salvar")
            })
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
