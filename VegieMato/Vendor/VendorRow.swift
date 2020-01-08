//
//  VendorView.swift
//  VegieMato
//
//  Created by Harmeet on 07/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct VendorRow: View {
	var vendor: Vendor
	
    var body: some View {
		HStack {
			Image(vendor.imageName)
				.resizable()
				.frame(width: 70, height: 70)
			
			VStack {
				Text(vendor.name)
					.font(.headline)
				
				Text(vendor.tagline)
					.font(.caption)
			}
			
			Spacer()
		}
    }
}

struct VendorRow_Previews: PreviewProvider {
    static var previews: some View {
		VendorRow(vendor: defaultVendor)
			.previewLayout(.fixed(width: 300, height: 80))
    }
}
