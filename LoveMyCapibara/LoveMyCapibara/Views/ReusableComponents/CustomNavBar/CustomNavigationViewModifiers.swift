//
//  SwiftUIView.swift
//  LoveMyCapibara
//
//  Created by José Winny on 16/06/23.
//


import SwiftUI


struct NavBarViewPet<Destination : View>: ViewModifier {
    @State var isShowingSheet = false
    var destination: () -> Destination
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(false)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Pets")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Adicionar"){
                        isShowingSheet.toggle()
                    }.sheet(isPresented: $isShowingSheet) {
                        destination()
                    }
                    
                }
            }
    }
}


struct NavBarViewInfoPet<Destination : View>: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    @State var isShowingSheet = false
    var destination: () -> Destination
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack{
                            Image("BackArrow")
                            Text("Pets")
                        }
                    }

                }
                ToolbarItem(placement: .principal) {
                    Text("Informações do pet")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Editar"){
                        isShowingSheet.toggle()
                    }.sheet(isPresented: $isShowingSheet) {
                        destination()
                    }
                }
            }
    }
}

struct NavBarViewAddPet: ViewModifier {
    var action : () -> Void
    @State var isShowingSheet = true
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(false)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Adicionar Pet")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Adicionar"){
                        action()
                        dismiss()
                    }
                }
            }
    }
}

struct NavBarViewEditPet: ViewModifier {
    var action : () -> Void
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(false)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Editar Pet")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salvar"){
                        action()
                        dismiss()
                    }
                }
            }
    }
}


extension View {
    ///This modifiers need to be use in the last line of NavigationView.
    ///- Important This modifier needs a NavigationView
    ///- need to put a destination to the add buton
    func navBarPet(destination: @escaping() -> some View) -> some View{
        self.modifier(NavBarViewPet(){
            destination()
        })
    }
    ///This modifiers need to be use in the last line of NavigationView.
    ///- Important This modifier needs a NavigationView
    ///- need to put a destination to the edit button
    func navBarInfoPet(destination: @escaping() -> some View) -> some View{
        self.modifier(NavBarViewInfoPet() {
            destination()
        })
    }
    ///This modifiers need to be use in the last line of NavigationView.
    ///- Important This modifier needs a NavigationView
    ///- need to put a action to the save button
    func navBarAddPet(action: @escaping () -> Void) -> some View{
        self.modifier(NavBarViewAddPet(){
            action()
        })
    }
    ///This modifiers need to be use in the last line of NavigationView.
    ///- Important This modifier needs a NavigationView
    ///- need to put a action to the add / save button
    func navBarEditPet(action: @escaping () -> Void) -> some View{
        self.modifier(NavBarViewEditPet(){
            action()
        })
    }
}
