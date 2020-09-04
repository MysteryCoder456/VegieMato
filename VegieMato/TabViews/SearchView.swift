//
//  SearchView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 03/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI
import Firebase

struct SearchView: View {
    @ObservedObject var vendorRepo = VendorRepository()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                List(vendorRepo.vendors.filter {
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
            vendorRepo.readVendors()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
