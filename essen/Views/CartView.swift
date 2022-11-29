//
//  CartView.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        ScrollView{
            
            Text("Cart").font(.headline).fontWeight(.heavy)
            
            ForEach(1...10, id: \.self){ _ in
                
                HStack(){
                    
                    Image("burger").resizable().scaledToFit().cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Food Catgory")
                        Text("Food Name").fontWeight(.bold)
                        Text("$20.00").foregroundColor(.orange).fontWeight(.bold)
                    }
                    Spacer()
                    VStack(){
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "minus").foregroundColor(.black).frame(width: 24, height: 24).padding(8).background(Color(hue: 1.0, saturation: 0.096, brightness: 0.903))
                        }).cornerRadius(20)
                        Spacer()
                        
                        Text("1")
                        
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "plus").foregroundColor(.white).frame(width: 24, height: 24).padding(8).background(.black)
                            
                        }).cornerRadius(20)
                        
                        
                        Spacer()
                    }
                }.padding(8).frame( height: 150 ).background(Color(red: 1.0, green: 1.0, blue: 1.0)).cornerRadius(16).shadow(color: Color.black.opacity(0.2), radius: 3, x: 1, y: 2)
                    .shadow(color: Color.pink.opacity(0.3), radius: 2, x: 3, y: 4)
            }.padding(8)
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
