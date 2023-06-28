//
//  ContentView.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                Text("")
                    .tabItem {
                        Label {
                            Text("Tarefas")
                        } icon: {
                            Image("task")
                        }
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                HomeView()
                    .tabItem {
                        Label {
                            Text("Pets")
                        } icon: {
                            Image("pawprint 1")
                        }
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                
                SettingsView()
                    .tabItem {
                        Label {
                            Text("Configurações")
                        } icon: {
                            Image("settings 1")
                        }
                    }
                    .toolbarBackground(.visible, for: .tabBar)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
