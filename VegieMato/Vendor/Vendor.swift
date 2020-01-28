//
//  Vendor.swift
//  VegieMato
//
//  Created by Harmeet on 27/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation


struct Vendor: Hashable {
    static func == (lhs: Vendor, rhs: Vendor) -> Bool {
        return lhs.name == rhs.name && lhs.tagline == rhs.tagline && lhs.imageName == lhs.imageName && lhs.products == rhs.products
    }
    
    var name: String
    var tagline: String
    var imageName: String
    var products: Array<String>
}
