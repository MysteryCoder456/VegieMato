//
//  ProfileView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 04/07/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    var user: User?
    @ObservedObject var vendorRepo = VendorRepository()
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Profile")
                .font(.largeTitle)
                .bold()
            
            ImageView(imageName: "examplePP", width: 200, height: 200)
            
            Text(user?.displayName ?? "No Username Provided")
                .font(.title)
            
            Divider()
            
            NavigationView {
                List(vendorRepo.userOwnedVendors) { vendor in
                    NavigationLink(destination: VendorView(vendor: vendor)) {
                        VendorRow(vendor: vendor)
                    }
                }
                .navigationBarTitle(Text("Vendors Owned by You"), displayMode: .inline)
            }
        }
        .padding(.top, -25.0)
        .onAppear() {
            vendorRepo.readUserOwnedVendors()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
