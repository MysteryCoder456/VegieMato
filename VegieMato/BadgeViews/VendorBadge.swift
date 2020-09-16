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
                .frame(height: 150)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(vendor.name)
                    .foregroundColor(.primary)
                
                Text(vendor.tagline)
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }
        .shadow(radius: 8)
    }
}

struct VendorBadge_Previews: PreviewProvider {
    static var previews: some View {
        VendorBadge(vendor: defaultVendor)
    }
}
