//
//  VendorBadge.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 09/16/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct VendorBadge: View {
    var vendor: Vendor
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image(vendor.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15, antialiased: true)
                .frame(height: 200)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(vendor.name)
                    .foregroundColor(.black)
                
                Text(vendor.tagline)
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }
        .padding(.trailing, 20)
        .shadow(radius: 10)
    }
}

struct VendorBadge_Previews: PreviewProvider {
    static var previews: some View {
        VendorBadge(vendor: defaultVendor)
    }
}
