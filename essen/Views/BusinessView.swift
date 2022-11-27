//
//  BusinessView.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI
import CoreLocation
import MapKit

struct BusinessView: View {
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(
        latitude: -1.2626889615093801,
        longitude: 36.818452689877205), span: MKCoordinateSpan(latitudeDelta: 0.01628962146283497, longitudeDelta: 0.01592863624435381))
    
    var body: some View {
        ScrollView{
            
            VStack( ) {
                HStack{
                    Image(systemName: "blinds.horizontal.open")
                    Spacer()
                    VStack{
                        Text("Location")
                        HStack{
                            Image(systemName: "location").foregroundColor(.blue)
                            Text("Nairobi Kenya")
                        }
                        
                    }
                    Spacer()
                    
                    Image(systemName: "cart")
                }.padding(8)
                
                VStack(alignment: .leading) {
                    Text("Hello Ian").font(.headline)
                    Text("You have 3 items in your cart")
                }.background(.red).padding(8)
                

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            
                            Button(action: {}, label: {HStack {
                                Image(systemName: "fork.knife")
                                Text("Fast Food").padding(8)
                            }}).foregroundColor(.white).background(.orange).cornerRadius(24).padding(8)
                            
                            
                            Button(action: {}, label: {HStack {
                                Image(systemName: "wineglass")
                                Text("Drinks ").padding(8).fontWeight(.medium)
                            }}).background(Color(hue: 1.0, saturation: 0.013, brightness: 0.981)).cornerRadius(24).padding(8)
                            
                            Button(action: {}, label: {HStack {
                                HStack {
                                    Image(systemName: "leaf")
                                   
                                    Text("Vegan").padding(8).fontWeight(.medium)
                                }
                            }}).background(Color(hue: 1.0, saturation: 0.013, brightness: 0.981)).cornerRadius(24).padding(8)
                          
                            
                            Button(action: {}, label: {HStack {
                                Image(systemName: "takeoutbag.and.cup.and.straw")
                                Text(" Snacks").padding(8).fontWeight(.medium)
                            }}).background(Color(hue: 1.0, saturation: 0.013, brightness: 0.981)).cornerRadius(24).padding(8)
                            
                            
                            
                            Button(action: {}, label: {HStack {
                                Image(systemName: "fish")
                                Text(" Sea Food").padding(8).fontWeight(.medium)
                            }}).background(Color(hue: 1.0, saturation: 0.013, brightness: 0.981)).cornerRadius(24).padding(8)
                            
                        }
                    }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        
                      
                        FoodDiscoverCard(category: "Fast Food", name: "Arabian beef Kebab", image: "burger", duration: "30min | 1 serving")
                        
                    
                        
                          FoodDiscoverCard(category: "Fast Food", name: "Arabian beef Kebab", image: "burger", duration: "30min | 1 serving")
                          
                      
                        
                        
                          FoodDiscoverCard(category: "Fast Food", name: "Arabian beef Kebab", image: "burger", duration: "30min | 1 serving")
                          
                      
                        
                          FoodDiscoverCard(category: "Fast Food", name: "Arabian beef Kebab", image: "burger", duration: "30min | 1 serving")
                          
                      
                       
                        
                        
                        
                    }.padding(8)
                }
                
                
                HStack {
                    Text("Near You")
                    Spacer()
                    Text("See map")
                }.padding(8)
                
                Map(coordinateRegion: $region
                ).frame(height: 240)
                
                
                
            }
            
            

            
            
        }
    }
}

struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView()
    }
}

struct FoodDiscoverCard: View {
    
    var category: String
    var name : String
    var image : String
    var duration : String
    var body: some View {
        ZStack(alignment: .leading){
            
            
            Image("burger").resizable().scaledToFit()
            
            VStack(alignment: .leading) {
                
                HStack(alignment: .bottom){
                    Text(category)
                    Spacer()
                    Image(systemName: "heart").foregroundColor(.white).background(alignment: .center, content: {
                        Rectangle().fill(Color(hue: 1.0, saturation: 0.006, brightness: 0.809)).frame(width: 25, height: 25).cornerRadius(8)
                    }).onTapGesture {
                        print("Liked")
                    }
                }
               
                Spacer()
                VStack(alignment: .leading) {
                    
                    
                    
                    Text(name).font(.system(size: 32)).foregroundColor(.white).fontWeight(.heavy)
                    
                   
                }
               
            }.padding(10)
            
            
        }.frame(width: UIScreen.main.bounds.width - 100).cornerRadius(10)
    }
}
