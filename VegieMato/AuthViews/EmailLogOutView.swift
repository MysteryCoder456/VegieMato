//
//  EmailLogOutView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 09/05/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI
import UserNotifications
import Firebase

struct EmailLogOutView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Log Out")
                .font(.largeTitle)
                .bold()
            
            Text("You will now be Logged out of your account...")
        }
        .padding(.horizontal)
        .onAppear() {
            logout()
        }
    }
    
    func logout() {
        var contentTitleString: String = ""
        var contentSubtitleString: String = ""
        
        do {
            try Auth.auth().signOut()
            contentTitleString = "Logged Out Successfully!"
            contentSubtitleString = "You have been Logged Out of VegieMato"
        } catch {
            contentTitleString = "Log Out Failed!"
            contentSubtitleString = error.localizedDescription
        }
        
        let content = UNMutableNotificationContent()
        content.title = contentTitleString
        content.subtitle = contentSubtitleString
        content.sound = .default

        // show this notification one seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

struct EmailLogOutView_Previews: PreviewProvider {
    static var previews: some View {
        EmailLogOutView()
    }
}
