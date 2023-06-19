import SwiftUI
import CoreData

struct PetDetailsView: View {
    var pet: PetModel
    @State var isPopUpActive: Bool = false
    @Environment(\.managedObjectContext) private var viewContext

    private func deletePetById(_ id: UUID) {
            let fetchRequest: NSFetchRequest<Pet> = Pet.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
            print(fetchRequest)
        
            do {
                let result = try viewContext.fetch(fetchRequest)
                let playerEntity = result.first

                if let playerEntity = playerEntity {
                    // Remover o petEntity do contexto e salvar as mudanças
                    viewContext.delete(playerEntity)
                    try viewContext.save()
                }
            } catch {
                print(error.localizedDescription)
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
                        deletePetById(pet.id)
                    })
                )
            }
            Spacer()
        }
    }
}

struct PetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailsView(pet: PetModel(imageName: "PetTestImage", id: UUID(), name: "Diego", gender: .female, specie: "Cachorro", birthDate: Date(), weight: 12.0, castrated: true))
    }
}
