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
    
    @ObservedObject var appState : EssenState = EssenState()
    @ObservedObject var authState : AuthState = AuthState()
    @ObservedObject var mapSwipeController : MapSwipeController =  MapSwipeController()
    
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(
        latitude: -1.2626889615093801,
        longitude: 36.818452689877205), span: MKCoordinateSpan(latitudeDelta: 0.01628962146283497, longitudeDelta: 0.01592863624435381))
    
    var body: some View {
        NavigationView {
            ScrollView{
                
                VStack( ) {
                    HStack{
                        Image(systemName: "blinds.horizontal.open")
                        Spacer()
                        VStack{
                            
                            HStack{
                                Image(systemName: "location").foregroundColor(.black)
                                Text("Nairobi, Kenya")
                            }
                            
                        }
                        Spacer()
                        
                        NavigationLink {
                            
                            CartView()
                            
                        } label: {
                            Image(systemName: "cart")
                        }
                    }.padding(8)
                    
                    ZStack {
                              Image("header")
                                  .resizable()
                        
                                  .blur(radius: 6)
                                  
                              Text("Hello, John\nYou have 23 discounted tickets")
                                  .fontWeight(.black)
                                  .foregroundColor(.white)
                          }.frame(maxWidth: .infinity, maxHeight: 96).cornerRadius(8).padding(8).shadow(color: Color.black.opacity(0.2), radius: 3, x: 1, y: 2)
                        .shadow(color: Color.pink.opacity(0.3), radius: 2, x: 3, y: 4)
                    
                    
                    

                    

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                
                                CategoryPill(image: "fork.knife", category: "Fast Food", active: true)
                                
                                
                                CategoryPill(image: "wineglass", category: "Drinks")
                                
                                
                                CategoryPill(image: "leaf", category: "Vegan")
                                
                                CategoryPill(image: "takeoutbag.and.cup.and.straw", category: "Snacks")
                                
                                
                                CategoryPill(image: "fish", category: "Sea Food")
                                
                        
                            }
                        }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            
                          
                           
                            
                            NavigationLink{
                                ItemView()
                            }label: { FoodDiscoverCard(category: "Fast Food", name: "Arabian beef Kebab", image: "burger", duration: "30min | 1 serving")}
                            
                        
                            
                            
                            NavigationLink{
                                ItemView()
                            }label: { FoodDiscoverCard(category: "Fast Food", name: "Arabian beef Kebab", image: "burger", duration: "30min | 1 serving")}
                            
                          
                            
                            
                            NavigationLink{
                                ItemView()
                            }label: { FoodDiscoverCard(category: "Fast Food", name: "Arabian beef Kebab", image: "burger", duration: "30min | 1 serving")}
                            
                              
                          
                            
                            NavigationLink{
                                ItemView()
                            }label: { FoodDiscoverCard(category: "Fast Food", name: "Arabian beef Kebab", image: "burger", duration: "30min | 1 serving")}
                            
                              
                          
                           
                            
                            
                            
                        }.padding(8)
                    }
                    
                    
                    HStack {
                        Text("Near You")
                        Spacer()
                        NavigationLink {
                           DiscoverView().environmentObject(authState).environmentObject(appState).environmentObject(mapSwipeController)
                        }label: {
                            Text("See map")
                        }
                    }.padding(8)
                    
                    Map(coordinateRegion: $region
                    ).frame(height: 240)
                    
                    
                    
                }
                
                

                
                
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
            
            
            Image(image).resizable().scaledToFit()
            
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
            
            
        }.frame(width: UIScreen.main.bounds.width - 100).cornerRadius(10).shadow(color: Color.black.opacity(0.2), radius: 2, x: 4, y: 3)
    }
}

struct CategoryPill: View {
    
    var image : String
    var category : String
    var active : Bool = false
    var body: some View {
        Button(action: {}, label: {HStack(spacing: 0) {
            Image(systemName: image).padding(.horizontal, 8)
            Text(category).padding(8)
        }}).foregroundColor(active ? .white : .black).background(active ? .orange : Color(hue: 1.0, saturation: 0.006, brightness: 0.809)).cornerRadius(24).padding(8).shadow(color: Color.black.opacity(0.2), radius: 3, x: 1, y: 2)
            .shadow(color: Color.pink.opacity(0.3), radius: 2, x: 3, y: 4)
    }
}
