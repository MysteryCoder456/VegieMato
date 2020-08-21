//
//  Product.swift
//  VegieMato
//
//  Created by Harmeet on 07/02/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation

struct Product: Equatable, Identifiable {
    var id = UUID()
    
    var name: String
    var price: Int // Price in Indian Rupees per Kilogram
}
