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
            ScrollView(.vertical) {
                Text("Profile")
                    .font(.largeTitle)
                    .bold()
                
                ImageView(imageName: "examplePP", width: 100, height: 100)
                
                Text(user?.displayName ?? "No Username Provided")
                    .font(.title)
                
                Divider()
                 
                ForEach(vendorRepo.userOwnedVendors) { vendor in
                    VendorRow(vendor: vendor)
                    Divider()
                }
            }
        }
        .padding(.top, -25.0)
        .onAppear() {
            self.vendorRepo.readUserOwnedVendors()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
