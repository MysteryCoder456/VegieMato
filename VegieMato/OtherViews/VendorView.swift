//
//  VendorView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 25/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct VendorView: View {
    var vendor: Vendor
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                
                VStack() {
                    ImageView(imageName: vendor.imageName, width: 100, height: 100)
                        .padding(.top, -10.0)
                    
                    Text(vendor.name)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.vertical, 5.0)
                        .multilineTextAlignment(.center)
                        .fixedSize()
                    
                    Text(vendor.tagline)
                        .font(.headline)
                    
//                    Spacer()
                }
                
                Spacer()
            }
            
            List(vendor.products) { product in
                VStack {
                    ProductRow(product: product)
                    Spacer()
                }
            }
            
            Spacer()
            
        }
    }
}

struct VendorView_Previews: PreviewProvider {
    static var previews: some View {
        VendorView(vendor: defaultVendor)
    }
}
