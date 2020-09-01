//
//  User.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 04/07/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    
    var name: String
    var email: String
    var password: String
    var profilePic: String
    var ownedVendor: Array<Vendor> = []
}

var exampleUser = User(name: "Username", email: "example@example.com", password: "p@ssw0rd", profilePic: "examplePP")
