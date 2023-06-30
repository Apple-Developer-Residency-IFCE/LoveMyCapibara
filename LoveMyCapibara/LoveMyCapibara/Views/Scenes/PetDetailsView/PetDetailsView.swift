import SwiftUI
import CoreData

struct PetDetailsView: View {
    @State var pet: PetModel
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var viewModel = PetDetailedViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            if let data = pet.imageName, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 394, height: 194)
                    .clipped()
            }
            HStack {
                LabelsOfPet()
                Spacer()
                PetAttributes(pet: pet)
            }
            AdicionalInfo(pet: pet)
            Spacer()
        }
        .navBarInfoPet(destination: {
            EditPetView(petInstance: pet)
        }, action: {
            if let petResult = viewModel.getUpdatedPet(pet.id) {
                pet = petResult
            } else {
                dismiss()
            }
        })
    }
}

struct PetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailsView(pet: PetModel(
            imageName: Data(),
            id: UUID(),
            name: "Diego",
            gender: .female,
            specie: "Cachorro",
            race: "Golden",
            birthDate: Date(),
            weight: 12.0,
            castrated: true
        ))
    }
}
