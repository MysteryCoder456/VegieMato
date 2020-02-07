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
        List {
            HStack {
                Spacer()
                
                VStack() {
                    ImageView(imageName: vendor.imageName, width: 200, height: 200)
                    
                    Text(vendor.name)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .padding(.vertical, 20.0)
                        .multilineTextAlignment(.center)
                    
                    Text(vendor.tagline)
                        .font(.headline)
                    
                    Spacer()
                }
                
                Spacer()
            }
            
            List(vendor.products) { product in
                VStack {
                    ProductRow(product: product)
                    Spacer()
                }
            }
        }
    }
}

struct VendorView_Previews: PreviewProvider {
    static var previews: some View {
        VendorView(vendor: defaultVendor)
    }
}
