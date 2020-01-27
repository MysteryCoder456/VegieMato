//
//  VendorInfo.swift
//  VegieMato
//
//  Created by Harmeet on 07/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation

var defaultVendor = Vendor(name: "Vendor Name", tagline: "Vendor Tagline", imageName: "vendor")

var vendors = [
    Vendor(name: "Carrots For Less", tagline: "Epic Carrots!", imageName: "carrot"),
    Vendor(name: "Potatoes R Us", tagline: "Epic Potatoes!", imageName: "potato"),
    Vendor(name: "Tomato Centre", tagline: "Epic Tomatoes!", imageName: "tomato")
]

struct Vendor: Hashable {
    var name: String
    var tagline: String
    var imageName: String
}
