//
//  Business.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import Foundation

import CoreLocation

class Business : Identifiable, ObservableObject{
    
    @Published var name : String
    @Published var location : String
    @Published var category : String
    @Published var items : [Itemm]
    
    @Published var coordinate: CLLocationCoordinate2D
    
    var id: Int
    
    init(id: Int,name: String, location: String, category: String, items: [Itemm], lat : Double, lng: Double) {
        self.name = name
        self.location = location
        self.category = category
        self.items = items
        self.id = id
        
        self.coordinate = CLLocationCoordinate2D(
                   latitude: lat,
                   longitude: lng)
    }
    
    
    
}
