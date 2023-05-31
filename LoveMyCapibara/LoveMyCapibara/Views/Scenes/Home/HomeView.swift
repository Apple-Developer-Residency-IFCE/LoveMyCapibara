//
//  HomeView.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct HomeView: View {
    @State var homeViewModel = HomeViewModel()
    
    let columns = [GridItem(.flexible())]
    var body: some View {
        NavigationView(){
            ScrollView{
                LazyVGrid(columns: columns, spacing: 10){
                    Group{
                        NavigationLink{
                            VStack(alignment: .center){
                                Image("tortinhaImage")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                                    .clipShape(Circle())
                                Text("Tortinha")
                            }
                        }label: {
                            PetCardView(petName: "Tortinha", petSpecies: "Gato", petImage: "tortinhaImage")
                        }
                        
                        NavigationLink{
                            VStack(alignment: .center){
                                Image("PetTestImage")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                                Text("Bob")
                            }
                        }label: {
                            PetCardView(petName: "Bob", petSpecies: "Cachorro", petImage: "PetTestImage")
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
