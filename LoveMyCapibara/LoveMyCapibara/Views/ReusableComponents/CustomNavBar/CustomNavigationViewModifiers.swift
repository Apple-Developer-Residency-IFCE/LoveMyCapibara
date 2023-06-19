//
//  SwiftUIView.swift
//  LoveMyCapibara
//
//  Created by José Winny on 16/06/23.
//

//This modifiers need to be use in the NavigationView.

import SwiftUI


struct NavBarViewPet: ViewModifier {
    @State var isShowingSheet = false
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
                        //TO-DO adicionar o sheet do add form.
                        Text("Hi")
                    }
                    
                }
            }
    }
}


struct NavBarViewInfoPet: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    @State var isShowingSheet = false
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Pets")
                }
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
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Editar"){
                        isShowingSheet.toggle()
                    }.sheet(isPresented: $isShowingSheet) {
                        //TO-DO adicionar sheet do edit form.
                        Text("Bora editar")
                    }
                }
            }
    }
}

struct NavBarViewAddPet: ViewModifier {
    @State var isShowingSheet = true
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(false)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Adicionar Pet")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancelar"){
                        isShowingSheet.toggle()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Adicionar"){
                        //TO-DO: Colocar a funçao de Add do Core Data
                    }
                }
            }
    }
}

struct NavBarViewEditPet: ViewModifier {
    @State var isShowingSheet = true
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(false)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Adicionar Pet")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancelar"){
                        isShowingSheet.toggle()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salvar"){
                        //TO-DO: Colocar a funçao de Update do Core Data
                    }
                }
            }
    }
}


extension View {
    func navBarPet() -> some View{
        self.modifier(NavBarViewPet())
    }
    func navBarInfoPet() -> some View{
        self.modifier(NavBarViewInfoPet())
    }
    func navBarAddPet() -> some View{
        self.modifier(NavBarViewAddPet())
    }
    func navBarEditPet() -> some View{
        self.modifier(NavBarViewEditPet())
    }
}
