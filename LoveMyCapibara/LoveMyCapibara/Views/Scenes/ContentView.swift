//
//  ContentView.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedItem = 1
    @State private var fact = Fact(fact: "", length: 0)
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedItem) {
                Text(fact.fact)
                    .tabItem {
                        Label {
                            Text("Tarefas")
                        } icon: {
                            Image(selectedItem == 0 ? "task_filled" : "task_outlined")
                        }
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .onAppear {
                        if fact.fact.isEmpty {
                            CatFactApi().newFact(maxLength: 120, completion: { fact in
                                self.fact = fact
                                print(self.fact)
                            })
                        }
                    }
                    .tag(0)
                HomeView()
                    .tabItem {
                        Label {
                            Text("Pets")
                        } icon: {
                            Image(selectedItem == 1 ? "pawprint_filled" : "pawprint_outlined")
                        }
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .tag(1)
                SettingsView()
                    .tabItem {
                        Label {
                            Text("Configurações")
                        } icon: {
                            Image(selectedItem == 2 ? "settings_filled" : "settings_outlined")
                        }
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .tag(2)
            }
            .tint(Color("DarkColor"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
