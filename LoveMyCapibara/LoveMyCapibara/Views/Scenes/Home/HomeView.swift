//
//  HomeView.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        Group{
            if homeViewModel.pets.isEmpty {
                HomeViewWithoutPets()
            }
            else{
                HomeViewWithPets(homeViewModel: homeViewModel)
            }
        }.onAppear{
            print(homeViewModel.pets)
            homeViewModel.updateList()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


