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
                                .font(.headline)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        }
                        
                        NavigationLink(destination: MakeVendorView()) {
                            Text("Make a new Vendor")
                                .font(.headline)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                       }
                        
                        NavigationLink(destination: EmailLogOutView()) {
                            Text("Log Out")
                                .font(.headline)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        }
                    } else {
                        NavigationLink(destination: EmailLoginView()) {
                            Text("Login with your Email")
                                .font(.headline)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                      }
                        
                        NavigationLink(destination: EmailSignUpView()) {
                            Text("Sign Up with your Email")
                                .font(.headline)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        }
                    }
                }
                .navigationBarTitle(Text("Others"))
                .environment(\.defaultMinListRowHeight, 60)
            }
        }
        .onAppear() {
            Auth.auth().currentUser?.reload(completion: { error in
                if let error = error {
                    print(error)
                }
            })
            self.currentUser = Auth.auth().currentUser
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
