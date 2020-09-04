//
//  VendorRepository.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 09/03/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class VendorRepository: ObservableObject {
    let db = Firestore.firestore()

    @Published var vendors: Array<Vendor> = []
    @Published var userOwnedVendors: Array<Vendor> = []
    
    init() {
        readVendors()
        readUserOwnedVendors()
    }

    func createVendor(vendor: Vendor) {
        do {
            let _ = try db.collection("vendors").addDocument(from: vendor)
        } catch {
            print(error)
        }
    }

    func readVendors() {
        db.collection("vendors").addSnapshotListener { querySnapshot, error in
            if let querySnapshot = querySnapshot {
                self.vendors = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: Vendor.self)
                        return x
                    } catch {
                        print(error)
                    }

                    return nil
                }
            }
        }
    }
    
    func readUserOwnedVendors() {
        if let currentUserID = Auth.auth().currentUser?.uid {
            db.collection("vendors").whereField("ownerID", isEqualTo: currentUserID).addSnapshotListener { querySnapshot, error in
                if let querySnapshot = querySnapshot {
                    self.userOwnedVendors = querySnapshot.documents.compactMap { document in
                        do {
                            let x = try document.data(as: Vendor.self)
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
}
