//
//  TitleBar.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 03/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI

struct TitleBar: View {
	var content: String
	var color: Color
	var size: CGFloat
	
    var body: some View {
		VStack {
			HStack {
				Spacer()
				
				Text(content)
					.font(.system(size: size))
					.fontWeight(.bold)
					.foregroundColor(.white)
                    .padding(.top, -25)
				
				Spacer()
			}
		}
        .frame(minHeight: 100)
		.background(color)
    }
}

struct TitleBar_Previews: PreviewProvider {
    static var previews: some View {
		TitleBar(content: "Title", color: Color.red, size: 40)
    }
}
