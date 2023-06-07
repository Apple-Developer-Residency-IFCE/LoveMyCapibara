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
        if homeViewModel.pets.isEmpty{
            HomeViewWithoutPets()
        }
        else{
            HomeViewWithPets()
        }
        
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}

struct HomeViewWithPets: View {
    @StateObject var homeViewModel = HomeViewModel()
    let columns = [GridItem()]
    var body: some View {
        NavigationView(){
            ScrollView{
                LazyVGrid(columns: columns, spacing: 10){
                    Group{
                        ForEach (homeViewModel.pets){
                            pet in
                            NavigationLink{
                                // This VStack should be remove by Pet View
                                VStack(alignment: .center){
                                    Image(pet.imageName)
                                        .resizable()
                                        .frame(width: 300, height: 300)
                                        .clipShape(Circle())
                                    Text(pet.name)
                                }
                            }label: {
                                PetCardView(petName: pet.name, petSpecies: pet.specie.rawValue, petImage: pet.imageName)
                            }
                        }
                    }
                    .frame(height: 100)
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                }
            }
            .padding(.top)
            .background(Color("BackgroundColor"))
        }
    }
}
