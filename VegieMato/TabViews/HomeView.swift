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
    @ObservedObject var vendorRepo = VendorRepository()
    
    var body: some View {
		VStack {
			TitleBar(content: "VegieMato", color: Color.green, size: 55)
			
			NavigationView {
                #if os(macOS)
                    List(vendorRepo.vendors) { vendor in
                        NavigationLink(destination: VendorView(vendor: vendor)) {
                            VendorRow(vendor: vendor)
                        }
                        .navigationBarTitle(Text("Available Vendors"), displayMode: .large)
                    }
                #else
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 20) {
                            ForEach(vendorRepo.vendors) { vendor in
                                NavigationLink(destination: VendorView(vendor: vendor)) {
                                    VendorBadge(vendor: vendor)
                                        .frame(width: 150)
                                }
                                .navigationBarTitle(Text("Available Vendors"), displayMode: .large)
                            }
                        }
                        .frame(minHeight: 230)
                        .padding(.leading)
                    }
                #endif
			}
			.padding(.top, -35)
		}
        .onAppear() {
            self.vendorRepo.readVendors()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
