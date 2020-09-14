//
//  AddProductView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 09/14/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI
import UserNotifications

struct AddProductView: View {
    @State var vendor: Vendor
    @ObservedObject var vendorRepo = VendorRepository()
    
    @State var newProductName = ""
    @State var newProductPrice = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Add a product to your Vendor!")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            VStack(alignment: .center) {
                Text("Enter your Product's name:")
                TextField("Product Name", text: $newProductName)
                .multilineTextAlignment(.center)
            }
            
            VStack(alignment: .center) {
                Text("Enter your Products's price:")
                TextField("Product Price (INR)", text: $newProductPrice)
                .multilineTextAlignment(.center)
            }
            
            Spacer()
                
            Button(action: addProduct) {
                Text("Add Product!")
                    .font(.title)
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    func addProduct() {
        let product = Product(id: UUID().uuidString, name: self.newProductName, price: Float(self.newProductPrice) ?? 0.0)
        
        vendor.products.append(product)
        
        vendorRepo.updateVendor(vendor: vendor)

        let content = UNMutableNotificationContent()
        content.title = "Product has been added"
        content.subtitle = "Check it out in your Vendors"
        content.sound = .default

        // show this notification one seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
        self.newProductName = ""
        self.newProductPrice = ""
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView(vendor: defaultVendor)
    }
}
