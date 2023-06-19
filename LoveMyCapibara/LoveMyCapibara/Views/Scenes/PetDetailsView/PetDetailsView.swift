import SwiftUI

struct PetDetailsView: View {
    var pet: PetModel
    @State var isPopUpActive: Bool = false
    
    
    var body: some View {
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
    }
}

struct PetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailsView(pet: PetModel(imageName: "PetTestImage", id: UUID(), name: "Diego", gender: .female, specie: "Cachorro", birthDate: Date(), weight: 12.0, castrated: true))
    }
}
