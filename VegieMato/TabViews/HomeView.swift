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
			
            #if targetEnvironment(macCatalyst)
                NavigationView {
                    List(vendorRepo.vendors) { vendor in
                        NavigationLink(destination: VendorView(vendor: vendor)) {
                            VendorRow(vendor: vendor)
                        }
                        .navigationBarTitle(Text("Available Vendors"), displayMode: .large)
                    }
                }.padding(.top, -35)
            #else
                NavigationView {
                    List {
                        Text("Available Vendors")
                            .font(.system(size: 35))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 20) {
                                ForEach(vendorRepo.vendors) { vendor in
                                    NavigationLink(destination: VendorView(vendor: vendor)) {
                                        VendorBadge(vendor: vendor)
                                            .frame(width: 150)
                                    }
                                    .navigationBarHidden(true)
                                }
                            }
                            .frame(minHeight: 250)
                            .padding(.horizontal)
                        }
                        
                        Text("Your Vendors")
                            .font(.system(size: 35))

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 20) {
                                ForEach(vendorRepo.userOwnedVendors) { vendor in
                                    NavigationLink(destination: VendorView(vendor: vendor)) {
                                        VendorBadge(vendor: vendor)
                                            .frame(width: 150)
                                    }
                                    .navigationBarHidden(true)
                                }
                            }
                            .frame(minHeight: 250)
                            .padding(.horizontal)
                        }
                    }
                }.padding(.top, -35)
            #endif
		}
        .onAppear() {
            self.vendorRepo.readVendors()
            self.vendorRepo.readUserOwnedVendors()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
