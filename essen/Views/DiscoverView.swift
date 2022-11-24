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
                              Rectangle().stroke(Color.blue)
                              .frame(width: 20, height: 20)
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
                                Text("\(item.name)")
                            }
                            .foregroundColor( Color.red )
                            .background( Color.black )
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
