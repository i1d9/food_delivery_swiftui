//
//  ContentView.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var appState : EssenState = EssenState()
    @ObservedObject var authState : AuthState = AuthState()
    @ObservedObject var mapSwipeController : MapSwipeController =  MapSwipeController()
    
    
    var body: some View {
        DiscoverView().environmentObject(authState).environmentObject(appState).environmentObject(mapSwipeController)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
