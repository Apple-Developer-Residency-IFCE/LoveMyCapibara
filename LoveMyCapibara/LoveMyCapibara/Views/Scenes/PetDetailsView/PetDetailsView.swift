import SwiftUI
import CoreData

struct PetDetailsView: View {
    var pet: PetModel
    @State var isPopUpActive: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
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
            CustomButton(buttonLabel: "Deletar", buttonAction: {
                isPopUpActive = !isPopUpActive
            }, buttonColor: "DeleteButtonColor")
            .alert(isPresented: $isPopUpActive){
                Alert(
                    title: Text("Deseja excluir o cadastro?"),
                    message: Text("Uma vez excluída, essa ação não pode ser desfeita."),
                    primaryButton: .cancel(Text("Cancelar"), action: {
                        isPopUpActive = false
                    }),
                    secondaryButton: .destructive(Text("Excluir"), action: {
                        print("O id é = \(pet.id)")
                        viewModel.deleteById(pet.id)
                        dismiss()
                    })
                )
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
