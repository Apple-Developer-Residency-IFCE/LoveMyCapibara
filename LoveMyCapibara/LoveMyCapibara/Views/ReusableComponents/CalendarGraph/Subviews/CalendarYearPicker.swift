//
//  CalendarYearPicker.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 06/07/23.
//

import SwiftUI
import Foundation

struct CalendarYearPicker: View {
    @State var selectedOption: Int = 2023
    var options = Array(Range(1900...2100))
    @State private var showingActionSheet = false

    var body: some View {
        Button("Mostrar ActionSheet") {
            showingActionSheet = true
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(
                title: Text("Título do ActionSheet"),
                message: Text("Mensagem do ActionSheet"),
                buttons: [
                    .default(Text("Opção 1"), action: {
                        // Ação para a opção 1
                    }),
                    .destructive(Text("Opção 2"), action: {
                        // Ação para a opção 2
                    }),
                    .cancel()
                ]
            )
        }
    }
}

struct CalendarYearPicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarYearPicker()
    }
}
