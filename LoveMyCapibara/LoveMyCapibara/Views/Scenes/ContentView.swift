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
                HomeView()
                    .tabItem {
                        Label("Pets", systemImage: "pawprint")
                        
//                        Label {
//                            Text("Pets")
//                        } icon: {
//                            Image("Icon Pet _ Outline")
//                                .resizable()
//                                .frame(width: 20,height: 20)
//                                .border(.red)
//                        }
                    }
                    
                    .toolbarBackground(.visible, for: .tabBar)
                
                SettingsView()
                    .tabItem {
                        Label("Configurações", systemImage: "gearshape")
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
