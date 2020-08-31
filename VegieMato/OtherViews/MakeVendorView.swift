//
//  MakeVendorView.swift
//  VegieMato
//
//  Created by Harmeet on 08/22/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI
import Firebase

struct MakeVendorView: View {
    @State var newVendorName: String = ""
    @State var newVendorTagline: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            VStack {
                Text("Enter your Vendor's name:")
                    .frame(alignment: .leading)
                TextField("Vendor Name", text: $newVendorName)
            }
            
            VStack {
                Text("Enter your Vendor's tagline:")
                    .frame(alignment: .leading)
                TextField("Vendor Tagline", text: $newVendorTagline)
            }
            
            Button(action: createNewVendor) {
                Text("Create Vendor!")
            }
        }
        .padding(.horizontal)
        
    }
    
    func createNewVendor() {
        let vendorDictionary = [
            "name": self.newVendorName,
            "tagline": self.newVendorTagline
        ]
        
        let docRef = Firestore.firestore().document("ratings/\(UUID().uuidString)")
        print("setting data")
        docRef.setData(vendorDictionary){ (error) in
            if let error = error {
                print("error = \(error)")
            } else {
                print("data uploaded successfully")
                self.newVendorName = ""
                self.newVendorTagline = ""
            }
        }
    }
}

struct MakeVendorView_Previews: PreviewProvider {
    static var previews: some View {
        MakeVendorView()
    }
}
