import SwiftUI
import CoreData

struct PetDetailsView: View {
    var pet: PetModel
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var viewModel = PetDetailedViewModel()
    
    
    var body: some View {
        VStack{
            if let data = pet.imageName, let uiImage = UIImage(data: data){
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 394, height: 194)
                    .clipped()
            }
            HStack{
                LabelsOfPet()
                Spacer()
                PetAttributes(pet: pet)
            }
            AdicionalInfo(pet: pet)
            
            // Link Temporário
            NavigationLink{
                EditPetView(petInstance: pet)
            }label: {
                Text("Editar")
            }
            Spacer()
        }
    }
}

struct PetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailsView(pet: PetModel(imageName: Data(), id: UUID(), name: "Diego", gender: .female, specie: "Cachorro", birthDate: Date(), weight: 12.0, castrated: true))
    }
}
