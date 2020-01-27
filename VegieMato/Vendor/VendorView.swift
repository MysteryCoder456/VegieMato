//
//  VendorView.swift
//  VegieMato
//
//  Created by Harmeet on 25/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct VendorView: View {
    var vendor: Vendor
    
    var body: some View {
        VStack {
            ImageView(imageName: vendor.imageName, width: 200, height: 200)
            
            Text(vendor.name)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 20.0)
            
            Text(vendor.tagline)
            
            Spacer()
        }
    }
}

struct VendorView_Previews: PreviewProvider {
    static var previews: some View {
        VendorView(vendor: defaultVendor)
    }
}
