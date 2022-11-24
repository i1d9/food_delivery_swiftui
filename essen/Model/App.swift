//
//  App.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import Foundation
import CoreLocation
import MapKit


public class EssenState: ObservableObject{
    
    @Published var businesses : [Business]
    @Published var current: Business
    
    @Published var region : MKCoordinateRegion
    
    init() {
        
        let businesses = [ Business(id: 1, name: "Business One", location: "Nairobi", category: "Foods", items: [], lat: -1.2871145572256584, lng: 36.8201724584125),
                           Business(id: 2, name: "Business Two", location: "Nairobi", category: "Foods", items: [], lat: -1.2626889615093801, lng: 36.818452689877205)]
        self.businesses = businesses
        
        self.current = businesses[0]
        self.region = MKCoordinateRegion(center: businesses[0].coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01628962146283497, longitudeDelta: 0.01592863624435381))

    }
    
}


public class AuthState : ObservableObject{
    
    @Published var token: String = ""
    @Published var username : String = ""
    @Published var email : String = ""
}
