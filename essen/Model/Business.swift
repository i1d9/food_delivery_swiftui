//
//  Business.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import Foundation

class Business : Identifiable, ObservableObject{
    
    @Published var name : String
    @Published var location : String
    @Published var category : String
    @Published var items : [Item]
    var id: UUID
    
    init(name: String, location: String, category: String, items: [Item]) {
        self.name = name
        self.location = location
        self.category = category
        self.items = items
        self.id = UUID()
    }
    
    
    
}
