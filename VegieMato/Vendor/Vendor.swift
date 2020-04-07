//
//  Vendor.swift
//  VegieMato
//
//  Created by Harmeet on 27/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation

struct Vendor: Identifiable {
    var id = UUID()
    
    var name: String
    var tagline: String
    var imageName: String
    var products: Array<Product>
}
