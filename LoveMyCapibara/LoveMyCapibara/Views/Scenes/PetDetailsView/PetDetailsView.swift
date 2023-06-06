import SwiftUI

struct PetDetailsView: View {
    var pet: PetModel
    var isCastreted: String{
        if pet.castrated == true{
            return "Sim"
        }else{
            return "Não"
        }
    }
    
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
            AdicionalInfo(pet: pet, isCastreted: isCastreted)
        }
    }
}

struct PetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailsView(pet: PetModel(imageName: "PetTestImage", id: 1, name: "Diego", gender: .female, specie: .dog, birthDate: Date(), weigth: 12.0, castrated: true))
    }
}
