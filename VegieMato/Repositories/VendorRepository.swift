//
//  VendorRepository.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 09/03/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation
import FirebaseFirestore


class VendorRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var vendors: Array<Vendor> = []
    
    func loadData() {
        db.collection("vendors")
        .addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            
            let names = documents.map { $0["name"]! }
            let taglines = documents.map { $0["tagline"]! }
            let products = documents.map { $0["products"]! }
            
            self.vendors.removeAll()
            
            for i in 0..<names.count {
                let uuid = UUID(uuidString: documents[i].documentID) ?? UUID()
                let name = names[i] as? String ?? "Failed to get name"
                let tagline = taglines[i] as? String ?? "Failed to get tagline"
                let vendorProducts = products[i] as? Array<[String:Any]> ?? []
                
                var productObjects: Array<Product> = []
                for prod in vendorProducts {
                    if let productName = prod["name"] as? String, let productPrice = prod["price"] as? Int {
                        let product = Product(name: productName, price: productPrice)
                        productObjects.append(product)
                    }
                }
                
                let vendor = Vendor(id: uuid, name: name, tagline: tagline, products: productObjects)
                self.vendors.append(vendor)
            }
        }
    }
}
