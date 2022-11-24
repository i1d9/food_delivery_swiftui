//
//  Item.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import Foundation


class Item : ObservableObject, Identifiable{
    
    @Published var name : String
    @Published var img : String
    @Published var rating : Int
    @Published var description : String
    @Published var price : Int
    
    var id: UUID
    
    init(name: String, img:  String, description: String, price: Int, rating : Int) {
        self.name = name
        self.id = UUID()
        self.description = description
        self.price = price
        self.rating = rating
        self.img = img
    }
}
