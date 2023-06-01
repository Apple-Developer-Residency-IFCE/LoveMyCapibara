//
//  HomeView.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct HomeView: View {
    @State var homeViewModel = HomeViewModel()
    
    let columns = [GridItem()]
    var body: some View {
        NavigationView(){
            ScrollView{
                LazyVGrid(columns: columns, spacing: 10){
                    Group{
                        ForEach (homeViewModel.pets){
                            pet in
                            NavigationLink{
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
        }
        
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
