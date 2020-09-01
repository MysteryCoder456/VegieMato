//
//  SwiftUIView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 25/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    var imageName: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: width, height: height)
            .clipShape(Circle())
//            .overlay(Circle().stroke(Color.black, lineWidth: 2))
            .shadow(radius: 5)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageName: "vendor", width: 200, height: 200)
    }
}
