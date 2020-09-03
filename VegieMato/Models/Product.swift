//
//  Product.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 07/02/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation

struct Product: Equatable, Identifiable, Codable {
    var id: String?
    var name: String
    var price: Int // Price in Indian Rupees per Kilogram
}

var defaultProducts = [Product(name: "Product 1", price: 100), Product(name: "Product 2", price: 200)]

/*
var products: [String:Array<Product>] = [
    "carrotsForLess": [
        Product(name: "Carrot (Per Kg)", price: 49),
        Product(name: "Carrot Cake", price: 400)
    ],
    
    "potatoesRUs": [
        Product(name: "Potato (Per Kg)", price: 37)
    ],
    
    "tomatoCentre": [
        Product(name: "Tomato (Per Kg)", price: 24),
        Product(name: "Tomato Soup", price: 49)
    ]
]
*/
