//
//  ProfileView.swift
//  VegieMato
//
//  Created by Harmeet on 03/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct OtherView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
//                    NavigationLink(destination: ProfileView())
                    Text("hi")
                }
                .navigationBarTitle(Text("Profile"))
            }
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
