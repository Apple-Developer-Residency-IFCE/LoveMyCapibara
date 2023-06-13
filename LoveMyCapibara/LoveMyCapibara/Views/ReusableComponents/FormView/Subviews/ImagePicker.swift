//
//  ImagePicker.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 07/06/23.
//

import PhotosUI
import SwiftUI

struct ImagePicker: View {
    @State var selectedItems: [PhotosPickerItem] = []
    @Binding var currentImage: Data?
    
    var body: some View {
        VStack{
            PhotosPicker(selection: $selectedItems, maxSelectionCount: 1, matching: .images) {
                VStack{
                    if let data = currentImage, let uiImage = UIImage(data: data){
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                        
                        Text("Trocar foto")
                    }else{
                        Circle()
                            .frame(width: 64, height: 64)
                        
                        Text("Escolher foto")
                            .foregroundColor(Color("PrimaryText"))
                    }
                }
                .foregroundColor(Color("PhotoPickerColor"))
            }
            .onChange(of: selectedItems) { newValue in
                guard let item = selectedItems.first else{
                    return
                }
                
                item.loadTransferable(type: Data.self) { result in
                    switch result{
                    case .success(let data):
                        if let data = data{
                            self.currentImage = data
                        }else{
                            print("Data is nil")
                        }
                    case .failure(let failure):
                        fatalError("\(failure)")
                    }
                }
            }
        }
    }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker(currentImage: .constant(UIImage(named: "PetTestImage")?.jpegData(compressionQuality: 1.0)))
    }
}
