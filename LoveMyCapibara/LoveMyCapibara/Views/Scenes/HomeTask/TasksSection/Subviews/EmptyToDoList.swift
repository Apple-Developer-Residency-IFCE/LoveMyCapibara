//
//  EmptyToDoList.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 03/07/23.
//

import SwiftUI

struct EmptyToDoList: View {
    
    let columns = [GridItem()]
    @State private var showCreateTask: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Image("Task Card Placeholder")
                .padding()
            Group {
                Text("Você não possui nenhuma tarefa pendente :)")
                    .font(FontManager.poppinsBold(size: 16))
                    .foregroundColor(Color("PrimaryText"))
                Text("Ao adicionar tarefas, elas aparecerão aqui")
                    .font(FontManager.poppinsRegular(size: 14))
                    .foregroundColor(Color("PrimaryText"))
            }
            .multilineTextAlignment(.center)
            CustomButton(buttonLabel: "Adicionar Tarefa", buttonAction: {
                showCreateTask.toggle()
            }, buttonColor: "PrimaryColor")
            .sheet(isPresented: $showCreateTask, content: {
                CreateTaskView()
            })
            .padding(.top)
        }
        .frame(maxWidth: .infinity)
    }
}

struct EmptyToDoList_Previews: PreviewProvider {
    static var previews: some View {
        EmptyToDoList()
    }
}
