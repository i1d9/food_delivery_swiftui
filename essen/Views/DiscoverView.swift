//
//  DiscoverView.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI
import MapKit


struct DiscoverView: View {
    

    
    var colors: [Color] = [.blue, .green, .red, .orange]
    
    @EnvironmentObject var appState : EssenState
    
        
        var body: some View {
   
            let spacing:            CGFloat = 4
            let widthOfHiddenCards: CGFloat = 8
            let cardHeight:         CGFloat = 120

        
            
            ZStack(alignment: .bottomLeading){
                
                
                Map(coordinateRegion: $appState.region,
                    annotationItems: appState.businesses
                      ) { place in
                    MapAnnotation(coordinate: place.coordinate) {
                        Image(systemName: "fork.knife").foregroundColor(.orange)
                              .frame(width: 40, height: 40)
                          }
                      }.ignoresSafeArea()
                    .onTapGesture(perform: {
                    print(appState.region)
                    
                        
                    
                    }).animation(.easeOut)
                
                    Carousel( numberOfItems: CGFloat( appState.businesses.count ), spacing: spacing, widthOfHiddenCards: widthOfHiddenCards )
                    {
                        ForEach( appState.businesses, id: \.self.id ) { item in
                            MapCard( _id:                  Int(item.id),
                                  spacing:              spacing,
                                  widthOfHiddenCards:   widthOfHiddenCards,
                                  cardHeight:           cardHeight )
                            {
                                
                                HStack(alignment: .top) {
                                    Image("burger").resizable().scaledToFit().cornerRadius(8)
                                    
                                    VStack(alignment: .leading) {
                                        Text("\(item.name)").font(.system(size: 24, weight: Font.Weight.bold))
                                        Text("Business Category")
                                        
                                        
                                        HStack{
                                            Image(systemName: "star.fill").foregroundColor(.orange)
                                            Text("4.5")
                                        }
                                    }
                                  
                                    Spacer()
                                }.padding(8)
                                
                            }
                            .background( Color.white )
                            .cornerRadius( 8 )
                            .transition( AnyTransition.slide )
                            .animation(.spring())
                           
                           
                        }
                    }
                }
                
                
            
        }
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView().environmentObject(EssenState()).environmentObject(AuthState()).environmentObject(MapSwipeController())
    }
}
