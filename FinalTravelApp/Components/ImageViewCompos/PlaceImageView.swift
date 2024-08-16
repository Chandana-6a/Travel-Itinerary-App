//
//  PlaceImageView.swift
//  Final Travel App
//
//  Created by chandana on 12/04/24.
//
//

import SwiftUI
import SDWebImageSwiftUI

struct PlaceImageView: View {
    let imageName: URL?
    let title: String
    var width : CGFloat = 354
    var height : CGFloat = 250
    var statImage: Image?
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            if let imageName = imageName {
                WebImage(url: imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .cornerRadius(20)
                    .padding(.top, 10)
            } else {
                statImage?
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .cornerRadius(20)
                    .padding(.top, 10)
            }
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
                .frame(width: width, height: 48, alignment: .center)
                .background(.ultraThinMaterial, in: UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 20, bottomTrailingRadius: 20, topTrailingRadius: 0))
        }        
    }
}

