//
//  ProfileView.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView{
            
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(systemName: "person").resizable().scaledToFit().foregroundColor(.white).padding(8).frame(width: 124, height: 124).padding(16).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.919)).clipShape(Circle()
                    )
                    
                    Image(systemName: "pencil").resizable().scaledToFit().frame(width: 8, height: 8).padding(16).foregroundColor(.white).background(.orange).clipShape(Circle()
                    )
                    
                }
                
                Text("John Doe").font(.system(size: 32)).fontWeight(.bold)
                Text("example@hostname.com").accentColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.592))
            }
            
            HStack{
                VStack(){
                  
                    Text("Order Food").padding(16).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.777)).font(.system(size: 18))
                    Text("120").foregroundColor(.orange).fontWeight(.heavy)
                }
                Divider()
                VStack(){
                    Text("Spending").padding(16).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.777)).font(.system(size: 18))
                    Text("$120").foregroundColor(.orange).fontWeight(.heavy)
                }
            }.padding(8).frame(maxWidth: .infinity).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.982)).cornerRadius(8).shadow(color: Color.black.opacity(0.1), radius: 2, x: 4, y: 4).padding(8)
                .shadow(color: Color.black.opacity(0.2), radius: 16, x: 8, y: 8)
            
            
           
            
            HStack {
                Image(systemName: "bell").padding(8).foregroundColor(.orange).background(Color(hue: 0.099, saturation: 0.076, brightness: 0.992)).cornerRadius(8)
                Text("Notification")
                Spacer()
                Image(systemName: "chevron.right")
            }.padding(16)
            
            HStack {
                Image(systemName: "location").padding(8).foregroundColor(.orange).background(Color(hue: 0.099, saturation: 0.076, brightness: 0.992)).cornerRadius(8)
                Text("Location")
                Spacer()
                Image(systemName: "chevron.right")
            }.padding(16)
            
            
            HStack {
                Image(systemName: "message").padding(8).foregroundColor(.orange).background(Color(hue: 0.099, saturation: 0.076, brightness: 0.992)).cornerRadius(8)
                Text("FAQ")
                Spacer()
                Image(systemName: "chevron.right")
            }.padding(16)
            
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
