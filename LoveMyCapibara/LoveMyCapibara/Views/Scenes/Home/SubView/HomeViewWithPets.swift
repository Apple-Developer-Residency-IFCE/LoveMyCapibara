//
//  HomeViewWithPets.swift
//  LoveMyCapibara
//
//  Created by José Winny on 07/06/23.
//

import SwiftUI

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
                                PetCardView(petName: pet.name, petSpecies: pet.specie, petImage: pet.imageName)
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

struct HomeViewWithPets_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewWithPets()
    }
}
