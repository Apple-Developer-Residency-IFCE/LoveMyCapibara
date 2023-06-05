import SwiftUI

struct PetDetailsView: View {
    var pet: PetModel
    var isCastreded: String{
        if pet.castraded == true{
            return "Sim"
        }else{
            return "Não"
        }
    }
    
    var body: some View {
        VStack{
            Image("PetTestImage")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 394, height: 194)
                .clipped()
            HStack{
                LabelsOfPet()
                Spacer()
                PetAttributes(pet: pet)
            }
            AdicionalInfo(pet: pet, isCastreded: isCastreded)
        }
    }
}

struct PetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailsView(pet: PetModel(imageName: "PetTestImage", id: 1, name: "Diego", gender: .female, specie: .dog, birthDate: Date(), weigth: 12.0, castraded: true))
    }
}
