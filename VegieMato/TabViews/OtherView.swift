//
//  ProfileView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 03/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI
import Firebase

struct OtherView: View {
    @State var currentUser = Auth.auth().currentUser

    var body: some View {
        NavigationView {
            VStack {
                List {
                    if currentUser != nil {
                        NavigationLink(destination: ProfileView(user: currentUser)) {
                            Text("Profile")
                        }
                        
                        NavigationLink(destination: MakeVendorView()) {
                            Text("Make a new Vendor")
                        }
                        
                        NavigationLink(destination: EmailLogOutView()) {
                            Text("Log Out")
                        }
                    } else {
                        NavigationLink(destination: EmailLoginView()) {
                            Text("Login with your Email")
                        }
                        
                        NavigationLink(destination: EmailSignUpView()) {
                            Text("Sign Up with your Email")
                        }
                    }
                }
                .navigationBarTitle(Text("Others"))
                .environment(\.defaultMinListRowHeight, 60)
            }
        }
        .onAppear() {
            currentUser = Auth.auth().currentUser
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
