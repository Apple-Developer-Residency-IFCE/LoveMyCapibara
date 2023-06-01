import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Configurações")
                    .font(FontManager.poppinsBold(size: 32))
                    .foregroundColor(Color("PrimaryText"))
                Text("APARÊNCIA")
                    .font(FontManager.poppinsBold(size: 11))
                    .foregroundColor(Color("PrimaryText"))
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 80))
            
            ThemesSelector()
            
            Spacer()
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct ThemesSelector: View {
    @State var selectedOption = 1
    
    var body: some View {
        HStack(alignment: .center, spacing: 40) {
            ThemeOption(imageName: "DefaultTheme", label: "Sistema", id: 1, selectedID: $selectedOption)
            ThemeOption(imageName: "LightModeTheme", label: "Light", id: 2, selectedID: $selectedOption)
            ThemeOption(imageName: "Dark mode", label: "Dark", id: 3, selectedID: $selectedOption)
        }
    }
}

struct ThemeOption: View {
    var imageName: String
    var label: String
    var id: Int
    @Binding var selectedID: Int
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 65, height: 160)
            Text(label)
                .font(FontManager.poppinsRegular(size: 13))
                .foregroundColor(Color("PrimaryText"))
            if selectedID == id {
                SelectedRadioIcon()
            } else {
                UnselectedRadioIcon()
            }
        }.onTapGesture {
            selectedID = id
        }
    }
}
