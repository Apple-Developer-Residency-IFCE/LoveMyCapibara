import SwiftUI

struct SettingsView: View {
    @StateObject var viewmodel = SettingsViewModel()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Configurações")
                .font(FontManager.poppinsBold(size: 32))
                .foregroundColor(Color("PrimaryText"))
            
            Section {
                HStack {
                    Spacer()
                    ThemeSelector()
                    Spacer()
                }
            } header: {
                Text("APARÊNCIA")
                    .font(FontManager.poppinsBold(size: 11))
                    .foregroundColor(Color("PrimaryText"))
            }
            Section {
                Toggle("Notificações", isOn: $viewmodel.isON)
                    .font(FontManager.poppinsRegular(size: 16))
                    .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                    .background(Color("NotificationToggle"))
                    .cornerRadius(12)
                    .onChange(of: viewmodel.isON) { value in
                        viewmodel.allowNotification(noticationValue: value)
                    }
            } header: {
                Text("SONS")
                    .font(FontManager.poppinsBold(size: 11))
                    .foregroundColor(Color("PrimaryText"))
            }
            Spacer()
        }
        .padding(.horizontal)
        .onChange(of: scenePhase, perform: {
            if $0 == .active {
                viewmodel.checkNotificationPermission(showAlert: false)
            }
        })
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
