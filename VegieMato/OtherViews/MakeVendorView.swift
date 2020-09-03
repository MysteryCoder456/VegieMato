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
            Spacer()
            
            Text("Start your new Vendor today!")
                .font(.largeTitle)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Enter your Vendor's name:")
                TextField("Vendor Name", text: $newVendorName)
            }
            
            VStack(alignment: .leading) {
                Text("Enter your Vendor's tagline:")
                TextField("Vendor Tagline", text: $newVendorTagline)
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
        let vendorRepo = VendorRepository()
        let vendorDictionary = [
            "name": self.newVendorName,
            "tagline": self.newVendorTagline,
            "products": []
        ] as [String : Any]
        
        let docRef = vendorRepo.db.document("vendors/\(UUID().uuidString)")
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
