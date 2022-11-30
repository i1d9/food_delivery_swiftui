//
//  SearchView.swift
//  essen
//
//  Created by Ian Nalyanya on 27/11/2022.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchQuery : String = ""
    var body: some View {
        ScrollView{
            
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(.white)
                TextField("What are you looking for?", text: $searchQuery)
            }.padding(16).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.935)).cornerRadius(20).padding(8)
            
            
            VStack(alignment: .leading) {
                Text("Popular").font(.headline).fontWeight(.bold).padding(8)
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 16){
                      
                        ForEach(1...10, id: \.self){_ in
                            HStack{
                                ZStack(alignment: .bottomLeading) {
                                    Image("header").resizable().scaledToFit()
                                    
                                    HStack {
                                        Text("Burgers").padding(8).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.892)).cornerRadius(8).foregroundColor(.white).padding(8)
                                        Spacer()
                                        
                                        Image(systemName: "heart").foregroundColor(.white).padding(8).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.892)).cornerRadius(8).padding(8)
                                    }
                                }.cornerRadius(8).shadow(color: Color.black.opacity(0.2), radius: 3, x: 2, y: 2)
                                    .shadow(color: Color.pink.opacity(0.3), radius: 2, x: 3, y: 3)
                                
                                
                            }.frame(width: 236)
                            
                            
                        }
                    }.padding(8)
                    
                
                    
                    
                    
                }.padding(8)
                
                HStack() {
                    Text("People are looking✨").font(.system(size: 24, weight: Font.Weight.bold))
                    Spacer()
                    Text("See all").foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.626)).font(.headline)
                }.padding(8)
                
                
                ForEach(1...10,  id: \.self){ _ in
                    PopularItemRow()
                }

                
                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct PopularItemRow: View {
    var body: some View {
        VStack{
            
            HStack{
                Image("burger").resizable().scaledToFit().frame(width: 84).cornerRadius(16)
                
                VStack(alignment: .leading, spacing: 16){
                    
                    Text("Food Name").font(.system(size: 24))
                    
                    HStack(alignment: .top){
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Text("4.5")
                    }
                    
                }
                Spacer()
                
                Image(systemName: "chevron.right")
            }.padding(8)
        }
    }
}
