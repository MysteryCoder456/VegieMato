//
//  SearchView.swift
//  VegieMato
//
//  Created by Harmeet on 03/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI
import Firebase

struct SearchView: View {
    @State private var searchText: String = ""
    @State var vendors: Array<Vendor> = []
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                List(vendors.filter {
                    searchText.isEmpty ? true : $0.name.contains(searchText)
                }) { vendor in
                    NavigationLink(destination: VendorView(vendor: vendor)) {
                        VendorRow(vendor: vendor)
                    }
                }
                .navigationBarTitle(Text("Search Vendors"))
            }
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
        //        let products = documents.map { $0["products"]! }
                
                print(names)
                print(taglines)
                
                vendors.removeAll()
                
                for i in 0..<names.count {
                    let uuid = UUID(uuidString: documents[i].documentID) ?? UUID()
                    let name = names[i] as? String ?? "Failed to get name"
                    let tagline = taglines[i] as? String ?? "Failed to get tagline"
        //            let vendorProducts = taglines[i] as? Array<Product> ?? []
                    
                    let vendor = Vendor(id: uuid, name: name, tagline: tagline)
                    vendors.append(vendor)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
