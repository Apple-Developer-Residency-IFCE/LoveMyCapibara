import SwiftUI

struct SettingsView: View {
    
    @State private var isSelected = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading,spacing: 20) {
                Text("Configurações")
                    .font(FontManager.poppinsBold(size: 32))
                    .foregroundColor(Color("PrimaryText"))
                Text("APARÊNCIA")
                    .font(FontManager.poppinsBold(size: 11))
                    .foregroundColor(Color("PrimaryText"))
            }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 80))
            
            HStack(alignment: .center, spacing: 40) {
                VStack {
                    Image("DefaultTheme")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65, height: 160)
                    Text("Sistema")
                        .font(FontManager.poppinsRegular(size: 13))
                        .foregroundColor(Color("PrimaryText"))
                    if isSelected{
                        Circle()
                            .frame(width: 20, height: 20)
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(Color("PrimaryColor"))
                            )
                            .foregroundColor(.clear)
                    }else{
                        Image("Icon Select _ Selected")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }.onTapGesture {
                    isSelected.toggle()
                }
                VStack {
                    Image("LightModeTheme")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65, height: 160)
                    Text("Light")
                        .font(FontManager.poppinsRegular(size: 13))
                        .foregroundColor(Color("PrimaryText"))
                    if isSelected{
                        Circle()
                            .frame(width: 20, height: 20)
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(Color("PrimaryColor"))
                            )
                            .foregroundColor(.clear)
                    }else{
                        Image("Icon Select _ Selected")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }.onTapGesture {
                    isSelected.toggle()
                }
                VStack {
                    Image("Dark mode")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65, height: 160)
                    Text("Dark")
                        .font(FontManager.poppinsRegular(size: 13))
                        .foregroundColor(Color("PrimaryText"))
                    if isSelected{
                        Image("Icon Select _ Selected")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }else{
                        Circle()
                            .frame(width: 20, height: 20)
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(Color("PrimaryColor"))
                            )
                            .foregroundColor(.clear)
                    }
                }.onTapGesture {
                    isSelected.toggle()
                }
            }
            Spacer()
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
