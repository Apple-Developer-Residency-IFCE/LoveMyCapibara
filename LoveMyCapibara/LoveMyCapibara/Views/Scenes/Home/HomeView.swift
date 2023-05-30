//
//  HomeView.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct HomeView: View {
    @State var homeViewModel = HomeViewModel()
    var body: some View {
        NavigationView(){
            List{
                Group {
                    NavigationLink{
                        Text("Info about the Pet")
                    }label: {
                        PetCardView(petName: "Bob", petSpecies: "dog", petImage: "PetTestImage")
                    }
                    NavigationLink{
                        Text("Info about the Pet")
                    }label: {
                        PetCardView(petName: "Bob", petSpecies: "dog", petImage: "PetTestImage")
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 34))
                .frame(height:96)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
