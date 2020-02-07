//
//  VendorInfo.swift
//  VegieMato
//
//  Created by Harmeet on 07/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation

var defaultProducts = [Product(name: "Product 1", price: 100), Product(name: "Product 2", price: 200)]
var defaultVendor = Vendor(name: "Vendor", tagline: "Vendor Tagline", imageName: "vendor", products: defaultProducts)

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

var vendors = [
    Vendor(name: "Carrots For Less", tagline: "Epic Carrots!", imageName: "carrot", products: products["carrotsForLess"]!),
    Vendor(name: "Potatoes R Us", tagline: "Epic Potatoes!", imageName: "potato", products: products["potatoesRUs"]!),
    Vendor(name: "Tomato Centre", tagline: "Epic Tomatoes!", imageName: "tomato", products: products["tomatoCentre"]!)
]
