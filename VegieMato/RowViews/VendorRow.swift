//
//  VendorView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 07/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct VendorRow: View {
	var vendor: Vendor
	
    var body: some View {
		HStack {
            ImageView(imageName: vendor.imageName, width: 80, height: 80)
			
            Spacer()
            
			VStack {
				Text(vendor.name)
					.font(.headline)
                    .multilineTextAlignment(.center)

				Text(vendor.tagline)
					.font(.caption)
                    .multilineTextAlignment(.center)
			}
            
			Spacer()
		}
    }
}

struct VendorRow_Previews: PreviewProvider {
    static var previews: some View {
		VendorRow(vendor: defaultVendor)
			.previewLayout(.fixed(width: 350, height: 100))
    }
}
