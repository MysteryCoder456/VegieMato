//
//  UserRepository.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 09/04/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation
/*
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class UserRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var users: Array<User> = []
    
    init() {
        readUsers()
    }

    func createUser(user: User) {
        do {
            let _ = try db.collection("users").addDocument(from: user)
        } catch {
            print(error)
        }
    }
    
    func getCurrentUser() -> User? {
        if let userID = Auth.auth().currentUser?.uid {
            var currentUsers: Optional<Array<User>>

            db.collection("users").whereField("id", isEqualTo: userID).getDocuments() { querySnapshot, error in
                currentUsers = querySnapshot?.documents.compactMap { document in
                    do {
                        let x = try document.data(as: User.self)
                        return x
                    } catch {
                        print(error)
                    }

                    return nil
                }

                return currentUsers?[0]
            }
        }

        return nil
    }

    func readUsers() {
        db.collection("users").addSnapshotListener { querySnapshot, error in
            if let querySnapshot = querySnapshot {
                self.users = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: User.self)
                        return x
                    } catch {
                        print(error)
                    }

                    return nil
                }
            }
        }
    }
}
*/
