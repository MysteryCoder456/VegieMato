//
//  Vendor.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 27/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Vendor: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var tagline: String
    var imageName: String = "exampleVendorPP"
    var products: Array<Product> = []
    var ownerID: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case products
        case ownerID
    }
}

var defaultVendor = Vendor(name: "Vendor", tagline: "Vendor Tagline", products: defaultProducts)

/*
var vendors = [
    Vendor(name: "Carrots For Less", tagline: "Epic Carrots!", imageName: "carrot", products: products["carrotsForLess"]!),
    Vendor(name: "Potatoes R Us", tagline: "Epic Potatoes!", imageName: "potato", products: products["potatoesRUs"]!),
    Vendor(name: "Tomato Centre", tagline: "Epic Tomatoes!", imageName: "tomato", products: products["tomatoCentre"]!)
]
*/
