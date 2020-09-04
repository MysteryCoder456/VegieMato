//
//  EmailAuthView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 09/05/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI
import UserNotifications
import Firebase

struct EmailLoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            VStack {
                Text("Login with Email")
                    .font(.largeTitle)
                    .bold()
                
                Text("You must Login to be able to start a vendor or modify your existing ones. If you don't have an account, go to the Sign Up Page.")
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            VStack(alignment: .center) {
                Text("Enter your Email:")
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .multilineTextAlignment(.center)
            }
            
            VStack(alignment: .center) {
                Text("Enter your Password:")
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()

            Button(action: login) {
                Text("Login")
                    .font(.title)
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    func login() {
        Auth.auth().signIn(withEmail: self.email, password: self.password, completion: {result, error in
            var contentTitleString: String = ""
            var contentSubtitleString: String = ""
            
            if let error = error {
                print(error)
                contentTitleString = "Login Failed!"
                contentSubtitleString = error.localizedDescription
                self.password = ""
            } else {
                print("\(self.email) has been logged in!")
                contentTitleString = "Login Successful!"
                contentSubtitleString = "You can now access all the features of the app! :D"
                self.email = ""
                self.password = ""
            }
            
            let content = UNMutableNotificationContent()
            content.title = contentTitleString
            content.subtitle = contentSubtitleString
            content.sound = .default

            // show this notification one seconds from now
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
        })
    }
}

struct EmailAuthView_Previews: PreviewProvider {
    static var previews: some View {
        EmailLoginView()
    }
}
