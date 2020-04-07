//
//  ProfileView.swift
//  VegieMato
//
//  Created by Harmeet on 04/07/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Profile")
                .font(.system(size: 50))
                .bold()
                .padding(.bottom, -15)
            
            Divider()
                .background(Color.black)
                .padding(.bottom)
            
            ImageView(imageName: user.profilePic, width: 300, height: 200)
            
            Text(user.name)
                .font(.title)
            
            Spacer()
        }
        .padding(.top, -25.0)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: exampleUser)
    }
}
