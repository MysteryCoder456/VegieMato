//
//  VendorInfo.swift
//  VegieMato
//
//  Created by Harmeet on 07/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation

var defaultVendor = Vendor(name: "Vendor", tagline: "Vendor Tagline", imageName: "vendor", products: ["none"])

var products = [
    "carrotsForLess": ["none"],
    "potatoesRUs": ["none"],
    "tomatoCentre": ["none"]
]

var vendors = [
    Vendor(name: "Carrots For Less", tagline: "Epic Carrots!", imageName: "carrot", products: products["carrotsForLess"]!),
    Vendor(name: "Potatoes R Us", tagline: "Epic Potatoes!", imageName: "potato", products: products["potatoesRUs"]!),
    Vendor(name: "Tomato Centre", tagline: "Epic Tomatoes!", imageName: "tomato", products: products["tomatoCentre"]!)
]
