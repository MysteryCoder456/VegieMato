//
//  ProductRow.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 07/02/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct ProductRow: View {
    var product: Product
    
    var body: some View {
        HStack(alignment: .center) {
            Text(product.name)
                .font(.system(size: 27))
                .bold()
            
            Spacer()
            
            Text("Rs. \(product.price)")
                .font(.system(size: 23))
        }
        .padding(.horizontal)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: defaultProducts[0])
            .previewLayout(.fixed(width: 350, height: 70))
    }
}
