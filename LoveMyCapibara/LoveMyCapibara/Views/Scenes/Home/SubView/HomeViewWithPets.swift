//
//  HomeViewWithPets.swift
//  LoveMyCapibara
//
//  Created by José Winny on 07/06/23.
//

import SwiftUI

struct HomeViewWithPets: View {
    @StateObject var homeViewModel: HomeViewModel
    
    let columns = [GridItem()]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    CardCuriosityView()
                    Group {
                        ForEach(homeViewModel.pets, id: \.id) { pet in
                            NavigationLink {
                                PetDetailsView(pet: pet)
                            }label: {
                                PetCardView(petName: pet.name, petSpecies: pet.specie, petImage: pet.imageName)
                            }
                        }
                    }
                    .frame(height: 100)
                }.onAppear {
                    homeViewModel.updateList()
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .background(Color("BackgroundColor"))
            .navBarPet(destination: {
                AddPetView()
            }, action: {
                homeViewModel.updateList()
            })
        }
    }
}
