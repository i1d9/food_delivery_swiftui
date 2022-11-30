//
//  ItemView.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI

struct ItemView: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            
            HStack {
            Button(action: {}, label: {
                
                Image(systemName: "chevron.backward").padding(.leading, 16)
            })
            Spacer()
            Button(action: {}, label: {
                

                
                
                Image(systemName: "heart").padding(.horizontal, 16)
            })
            }.zIndex(1)
            
            VStack(){
               
                Image("burger").resizable()
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Food Name").font(.system(size: 32)).fontWeight(.bold)
                            
                            HStack {
                                Image(systemName: "star.fill").foregroundColor(.orange)
                                Text("4.3").fontWeight(.bold)
                            }
                            
                        }
                        Spacer()
                        
                        HStack(spacing: 16){
                            Button(action: {}, label: {
                                Image(systemName: "minus").foregroundColor(.black)
                            }).padding(8)
                           
                            Text("1")
                            
                            Button(action: {}, label: {
                                Image(systemName: "plus").foregroundColor(.black)
                            }).padding(16)
                        }.background(Color(red: 0.959, green: 0.969, blue: 0.982)).cornerRadius(10)
                        
                        
                    }
                    
                    ScrollView {
                        Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?")
                    }
                }.padding(16)
                    
                HStack(){
                    VStack(alignment: .leading){
                        Text("Price").font(.system(size: 16)).fontWeight(.bold)
                        Text("$15").foregroundColor(.orange).font(.system(size: 32)).fontWeight(.bold)
                    }
                    Spacer()
                    
                    Button(action: {}, label: {Text("Checkout").fontWeight(.bold).padding(16).foregroundColor(.white).background(Color(red: 0.06, green: 0.091, blue: 0.166))}).cornerRadius(10)
                }.padding(16).frame(alignment: .bottom).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.996))
                    
                
            }.ignoresSafeArea().background(Color(red: 1.0, green: 1.0, blue: 1.0))
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
