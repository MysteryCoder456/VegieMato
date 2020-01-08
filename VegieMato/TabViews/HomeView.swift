//
//  HomeView.swift
//  VegieMato
//
//  Created by Harmeet on 03/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
		VStack {
			TitleBar(content: "VegieMato", color: Color.green, size: 57)
			
			NavigationView {
				List(vendors, id: \.self) { vendor in
					VendorRow(vendor: vendor)
				}
				.navigationBarTitle(Text("Available Vendors"), displayMode: .large)
			}
			.padding(.top, -36)
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
