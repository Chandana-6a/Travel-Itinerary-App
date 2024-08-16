//
//  ReflecImageWebUrl.swift
//  Final Travel App
//
//  Created by chandana on 19/04/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReflecImageWebUrl: View {
    let bottomImage: URL?
    
    var body: some View {
        ZStack(alignment: .top) {
            
            if let bottomImage = bottomImage{
                WebImage(url: bottomImage)
                    .resizable()
                    .frame(width: 330, height: 177)
                    .cornerRadius(10)
                    .padding(.top, 107)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 330, height: 177)
                    .cornerRadius(10)
                    .padding(.top, 107)
            }
            
            BackdropBlurView(radius: 8)
                .cornerRadius(10)
                .cornerRadius(10)
                .frame(width: 350, height: 190)
                .padding(.top, 114)
            
            if let bottomImage = bottomImage{
                WebImage(url: bottomImage)
                    .resizable()
                    .frame(width: 354, height: 276)
                    .clipped()
                    .cornerRadius(10)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 354, height: 276)
                    .clipped()
                    .cornerRadius(10)
            }
        }
    }
}
