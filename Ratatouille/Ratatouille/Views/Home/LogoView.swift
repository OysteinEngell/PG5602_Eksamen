

import SwiftUI

struct LogoView: View {
    let isDarkmode = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
    
    var body: some View {
        HStack{
           
                let image = isDarkmode ? "LogoSmall" : "LogoSmallNegative"
           Spacer()
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
           Spacer()
        }
    }
}

#Preview {
    LogoView()
}
