//
//  ContentView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 03/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct AppView: View {
	var body: some View {
		TabView {
			HomeView()
				.tabItem {
					Image(systemName: "house.fill")
					Text("Home")
			}
			
			SearchView()
				.tabItem {
					Image(systemName: "magnifyingglass")
					Text("Search")
			}
					
			OtherView()
                .tabItem {
                    Image(systemName: "tray.fill")
                    Text("Other")
			}
		}
	}
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
