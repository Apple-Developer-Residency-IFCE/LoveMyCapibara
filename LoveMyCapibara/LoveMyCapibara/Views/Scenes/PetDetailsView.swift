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

struct LabelsOfPet: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 16){
            Text("Informações")
                .font(FontManager.poppinsBold(size: 20))
                .foregroundColor(Color("PrimaryText"))
                .padding(.bottom, 4)
            Text("Nome")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
            Text("Espécie")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
            Text("Nascimento")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
            Text("Raça")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
            Text("Peso")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
        }.padding(EdgeInsets(top: 32, leading: 24, bottom: 0, trailing: 0))
    }
}

struct AdicionalInfo: View {
    
    var pet : PetModel
    var isCastreded: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Divider()
                .frame(width: 346, height: 2)
                .overlay(Color("SecondaryText"))
            Text("Adicionais")
                .font(FontManager.poppinsBold(size: 20))
                .foregroundColor(Color("PrimaryText"))
            HStack{
                Text("Castrado(a)?")
                    .font(FontManager.poppinsBold(size: 16))
                    .foregroundColor(Color("PrimaryText"))
                Spacer()
                Text("\(isCastreded)")
                    .font(FontManager.poppinsBold(size: 16))
                    .foregroundColor(Color("PrimaryText"))
            }
        }.padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
    }
}

struct PetAttributes: View {
    var pet : PetModel
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: pet.birthDate)
    }
    
    var formattedWeight: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        return numberFormatter.string(from: NSNumber(value: pet.weigth)) ?? ""
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 16){
            Image("Icon Macho _ Default")
            Text("\(pet.name)")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
            Text("\(pet.specie.rawValue)")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
            Text("\(formattedDate)")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
            Text("\(pet.race)")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
            Text("\(formattedWeight) Kg")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
        }.padding(EdgeInsets(top: 32, leading: 0, bottom: 0, trailing: 24))
    }
}
