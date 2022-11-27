//
//  essenApp.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI

@main
struct essenApp: App {
    
    @ObservedObject var appState : EssenState = EssenState()
    @ObservedObject var authState : AuthState = AuthState()
    @ObservedObject var mapSwipeController : MapSwipeController =  MapSwipeController()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(authState).environmentObject(appState).environmentObject(mapSwipeController)
        }
    }
}
