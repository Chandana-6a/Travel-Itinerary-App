//
//  ReflectImageView.swift
//  Final Travel App
//
//  Created by chandana on 13/04/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReflectImageView: View {
    let Placeimage: Image

    var body: some View {
        ZStack(alignment: .top) {
            
            Placeimage
                .resizable()
                .frame(width: 330, height: 177)
                .cornerRadius(10)
                .padding(.top, 107)
            BackdropBlurView(radius: 8)
                .cornerRadius(10)
                .frame(width: 350, height: 190)
                .padding(.top, 114)
            
            Placeimage
                .resizable()
                .frame(width: 354, height: 276)
                .clipped()
                .cornerRadius(10)
        }
    }
}

#Preview {
    ReflectImageView(Placeimage: Image("UbudPlace1"))
}


