//
//  ContentView.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI

struct ContentView: View {
    
  
    
    var body: some View {
        
        
        TabView{
            
            BusinessView().tabItem {
                Image(systemName: "house")
            }
            
            SearchView().tabItem {
                Image(systemName: "magnifyingglass")
            }
            FavouriteView().tabItem {
                Image(systemName: "heart")
            }
            
            ProfileView().tabItem {
                Image(systemName: "person")
            }
            
        }.accentColor(.orange)

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
