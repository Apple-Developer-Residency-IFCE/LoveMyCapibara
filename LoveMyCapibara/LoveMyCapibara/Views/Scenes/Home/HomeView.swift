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
                            Text("Tortinha")
                        }label: {
                            PetCardView(petName: "Tortinha", petSpecies: "Gato", petImage: "tortinhaImage")
                        }
                        
                        NavigationLink{
                            Text("Bob")
                        }label: {
                            PetCardView(petName: "Bob", petSpecies: "Cachorro", petImage: "PetTestImage")
                        }
                    }
                    .frame(height: 100)
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                }
            }
        }
        .navigationTitle("Pets")
    }

//    let data = (1...100).map { "Item \($0)" }
//
//        let columns = [
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible())
//        ]
//
//        var body: some View {
//            ScrollView(.horizontal) {
//                LazyHGrid(rows: columns, spacing: 20) {
//                    ForEach(data, id: \.self) { item in
//                        Text(item)
//                    }
//                }
//                .padding(.horizontal)
//            }
//            .frame(maxHeight: 300)
//        }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
