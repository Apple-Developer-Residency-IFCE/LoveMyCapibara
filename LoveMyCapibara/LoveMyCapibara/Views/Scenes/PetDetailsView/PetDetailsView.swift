import SwiftUI

struct PetDetailsView: View {
    var pet: PetModel
    
    var body: some View {
        NavigationView {
            VStack{
                Image(pet.imageName)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 394, height: 194)
                    .clipped()
                HStack{
                    LabelsOfPet()
                    Spacer()
                    PetAttributes(pet: pet)
                }
                AdicionalInfo(pet: pet)
                Spacer()
            }
            .navBarInfoPet()
        }
    }
}

struct PetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailsView(pet: PetModel(imageName: "PetTestImage", id: 1, name: "Diego", gender: .female, specie: "Cachorro", birthDate: Date(), weight: 12.0, castrated: true))
    }
}
