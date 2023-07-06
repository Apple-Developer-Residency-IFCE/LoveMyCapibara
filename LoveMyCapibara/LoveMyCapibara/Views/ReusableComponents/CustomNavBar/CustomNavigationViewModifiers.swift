//
//  SwiftUIView.swift
//  LoveMyCapibara
//
//  Created by José Winny on 16/06/23.
//

import SwiftUI

struct NavBarViewPet<Destination: View>: ViewModifier {
    @State var isShowingSheet = false
    var action: () -> Void
    var destination: () -> Destination
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("Pets", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Adicionar") {
                        isShowingSheet.toggle()
                    }
                    .font(FontManager.poppinsBold(size: 16))
                    .foregroundColor(Color("PrimaryColor"))
                    .sheet(isPresented: $isShowingSheet, onDismiss: {
                        action()
                    }){
                        destination()
                    }
                }
            }
    }
}

struct NavBarViewTasks: ViewModifier {
    @State private var selected = false
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}, label: {Image("love_label")})
                        .foregroundColor(Color("PrimaryColor"))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {selected = !selected}, label: {Image(selected ? "calendar_filled" : "calendar_outlined")})
                        .foregroundColor(Color("PrimaryColor"))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {Image("plus")})
                        .foregroundColor(Color("PrimaryColor"))
                }
            }
    }
}


struct NavBarViewInfoPet<Destination : View>: ViewModifier {
    @Environment(\.dismiss) var dismiss
    var action: () -> Void
    @State var isShowingSheet = false
    var destination: () -> Destination
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("Informações do Pet", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image("BackArrow")
                                .resizable()
                                .frame(width: 12, height: 21)
                            
                            Text("Pets")
                                .font(FontManager.poppinsRegular(size: 16))
                                .foregroundColor(Color("PrimaryColor"))
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Editar") {
                        isShowingSheet.toggle()
                    }
                    .font(FontManager.poppinsBold(size: 16))
                    .foregroundColor(Color("PrimaryColor"))
                    .sheet(isPresented: $isShowingSheet, onDismiss: action, content: destination)
                }
            }
    }
}

struct NavBarViewAddPet: ViewModifier {
    @State var isShowingSheet = true
    @Environment(\.dismiss) var dismiss
    var isDisabled: Bool
    var action: () -> Void
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("Adicionar Pet", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar"){
                        dismiss()
                    }
                    .font(FontManager.poppinsRegular(size: 16))
                    .foregroundColor(Color("PrimaryColor"))
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Adicionar"){
                        action()
                        dismiss()
                    }
                    .disabled(isDisabled)
                    .font(FontManager.poppinsBold(size: 16))
                    .foregroundColor(isDisabled ? Color("SecondaryText") : Color("PrimaryColor"))
                }
            }
    }
}

struct NavBarViewEditPet: ViewModifier {
    var isDisabled: Bool
    var action: () -> Void
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("Editar Pet", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                    .font(FontManager.poppinsRegular(size: 16))
                    .foregroundColor(Color("PrimaryColor"))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salvar") {
                        action()
                        dismiss()
                    }
                    .disabled(isDisabled)
                    .font(FontManager.poppinsBold(size: 16))
                    .foregroundColor(isDisabled ? Color("SecondaryText") : Color("PrimaryColor"))
                    
                }
            }
    }
}

struct NavBarViewInfoTask<Destination: View>: ViewModifier {
    var title: String
    var destination: () -> Destination
    var action: () -> Void
    @Environment(\.dismiss) var dismiss
    @State var isShowingSheet = false
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitle(title, displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image("BackArrow")
                                .resizable()
                                .frame(width: 12, height: 21)
                                                            
                            Text("Tarefas")
                                .font(FontManager.poppinsRegular(size: 16))
                                .foregroundColor(Color("PrimaryColor"))
                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Editar") {
                        isShowingSheet.toggle()
                    }
                    .font(FontManager.poppinsBold(size: 16))
                    .foregroundColor(Color("PrimaryColor"))
                    .sheet(isPresented: $isShowingSheet, onDismiss: action, content: destination)
                }
            }
    }
}

extension View {
    /// This modifiers need to be use in the last line of NavigationView.
    /// Important This modifier needs a NavigationView
    /// need to put a destination to the add buton
    func navBarPet(destination: @escaping() -> some View, action: @escaping () -> Void) -> some View {
        self.modifier(NavBarViewPet(action: action, destination: destination))
    }
    /// This modifiers need to be use in the last line of NavigationView.
    /// Important This modifier needs a NavigationView
    /// need to put a destination to the edit button
    func navBarInfoPet(destination: @escaping() -> some View, action: @escaping () -> Void) -> some View {
        self.modifier(NavBarViewInfoPet(action: action, destination: destination))
    }
    /// This modifiers need to be use in the last line of NavigationView.
    /// Important This modifier needs a NavigationView
    /// need to put a action to the save button
    func navBarAddPet(isDisabled: Bool, action: @escaping () -> Void) -> some View {
        self.modifier(NavBarViewAddPet(isDisabled: isDisabled, action: action))
    }
    /// This modifiers need to be use in the last line of NavigationView.
    /// Important This modifier needs a NavigationView
    /// need to put a action to the add / save button
    func navBarEditPet(isDisabled: Bool, action: @escaping () -> Void) -> some View {
        self.modifier(NavBarViewEditPet(isDisabled: isDisabled, action: action))
    }
    
    func navBarTask() -> some View {
        self.modifier(NavBarViewTasks())
    }
    
    /// This modifiers need to be use in the last line of NavigationView.
    /// Important This modifier needs a NavigationView
    /// need to put a destination to the edit button
    func navBarViewInfoTask(title: String, destination: @escaping () -> some View, action: @escaping () -> Void) -> some View {
        self.modifier(NavBarViewInfoTask(title: title, destination: destination, action: action))
    }
}
