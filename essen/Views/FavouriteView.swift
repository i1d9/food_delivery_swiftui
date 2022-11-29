//
//  FavouriteView.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text("Favourite food").font(.system(size: 32)).fontWeight(Font.Weight.heavy).padding(.bottom, 16.0)
                Text("See the list of likes of your food to order it press on the 'love icon to remove it'")
                    .foregroundColor(Color(hue: 1.0, saturation: 0.019, brightness: 0.44))
                    .padding(.bottom, 8.0)
            }.padding(4)
            
            ForEach(1...10, id: \.self) {_ in
                   
                HStack(alignment: .top){
                    
                    Image("burger").resizable().scaledToFit().cornerRadius(10)
                    VStack(alignment: .leading){
                        Text("Food Name").font(.system(size: 24))
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.orange)
                            Text("4.5")
                        }
                        

                    }
                    Spacer()
                    Image(systemName: "heart.fill").foregroundColor(Color.red)
                }.padding(16).frame(width: UIScreen.main.bounds.width - 10, height: 120) .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(8)
                
                    

            }.shadow(color: Color.black.opacity(0.2), radius: 3, x: 1, y: 2)
                .shadow(color: Color.pink.opacity(0.3), radius: 2, x: 3, y: 4)
            
            
            
        }.background(Color(hue: 1.0, saturation: 0.0, brightness: 0.984))
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
