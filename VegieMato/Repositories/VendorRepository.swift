//
//  VendorRepository.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 09/03/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class VendorRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var vendors: Array<Vendor> = []
    
    func setData(dataDict: [String:Any]) {
        let docRef = self.db.document("vendors/\(UUID().uuidString)")
        print("setting data")
        
        docRef.setData(dataDict) {error in
            if let error = error {
                print("error = \(error)")
            } else {
                print("data uploaded successfully")
            }
        }
    }
    
    func loadData() {
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
}
