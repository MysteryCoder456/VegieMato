//
//  ProfileView.swift
//  VegieMato
//
//  Created by Harmeet on 03/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct OtherView: View {
    var user: User
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: ProfileView(user: exampleUser)) {
                        Text("Account")
                    }
                }
                .navigationBarTitle(Text("Profile"))
                .environment(\.defaultMinListRowHeight, 60)
            }
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView(user: exampleUser)
    }
}
