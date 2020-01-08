//
//  VendorView.swift
//  VegieMato
//
//  Created by Harmeet on 07/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct VendorView: View {
	var vendor: Vendor
	
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct VendorView_Previews: PreviewProvider {
    static var previews: some View {
		VendorView(vendor: defaultVendor)
    }
}
