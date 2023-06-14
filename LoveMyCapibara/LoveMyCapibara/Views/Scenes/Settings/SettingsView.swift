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
            
            ThemeSelector()
            
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
