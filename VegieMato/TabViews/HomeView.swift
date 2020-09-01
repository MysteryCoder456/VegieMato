//
//  HomeView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 03/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @State var vendors: Array<Vendor> = []
    
    var body: some View {
		VStack {
			TitleBar(content: "VegieMato", color: Color.green, size: 55)
			
			NavigationView {
				List(vendors) { vendor in
                    NavigationLink(destination: VendorView(vendor: vendor)) {
                        VendorRow(vendor: vendor)
                    }
				}
				.navigationBarTitle(Text("Available Vendors"), displayMode: .large)
			}
			.padding(.top, -35)
		}
        .onAppear() {
            Firestore.firestore().collection("vendors")
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                
                let names = documents.map { $0["name"]! }
                let taglines = documents.map { $0["tagline"]! }
                let products = documents.map { $0["products"]! }
                
                print(names)
                print(taglines)
                print(products)
                
                vendors.removeAll()
                
                for i in 0..<names.count {
                    let uuid = UUID(uuidString: documents[i].documentID) ?? UUID()
                    let name = names[i] as? String ?? "Failed to get name"
                    let tagline = taglines[i] as? String ?? "Failed to get tagline"
                    let vendorProducts = products[i] as? Array<[String:Any]> ?? []
                    
                    let productObjects: Array<Product> = []
                    for prod in vendorProducts {
                        let productName = prod["name"]
                        let productPrice = prod["price"]
                        let product = Product(name: productName, price: productPrice)
                        productObjects.append(product)
                    }
                    
                    let vendor = Vendor(id: uuid, name: name, tagline: tagline, products: productObjects)
                    vendors.append(vendor)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
