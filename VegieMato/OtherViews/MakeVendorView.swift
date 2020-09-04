//
//  MakeVendorView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 08/22/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI
import Firebase

struct MakeVendorView: View {
    @State var newVendorName: String = ""
    @State var newVendorTagline: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Start your new Vendor today!")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            VStack(alignment: .center) {
                Text("Enter your Vendor's name:")
                TextField("Vendor Name", text: $newVendorName)
                .multilineTextAlignment(.center)
            }
            
            VStack(alignment: .center) {
                Text("Enter your Vendor's tagline:")
                TextField("Vendor Tagline", text: $newVendorTagline)
                .multilineTextAlignment(.center)
            }
            
            Spacer()
                
            Button(action: createNewVendor) {
                Text("Create Vendor!")
                    .font(.title)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        
    }
    
    func createNewVendor() {
        if let currentUserID = Auth.auth().currentUser?.uid {
            let vendorRepo = VendorRepository()
            let vendorObject = Vendor(id: UUID().uuidString, name: self.newVendorName, tagline: self.newVendorTagline, ownerID: currentUserID)

            vendorRepo.createVendor(vendor: vendorObject)
            self.newVendorName = ""
            self.newVendorTagline = ""
        }
    }
}

struct MakeVendorView_Previews: PreviewProvider {
    static var previews: some View {
        MakeVendorView()
    }
}
