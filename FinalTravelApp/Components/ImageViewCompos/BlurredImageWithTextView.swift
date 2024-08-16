//
//  BlurredImageWithTextView.swift
//  Final Travel App
//
//  Created by chandana on 06/04/24.
//

import SwiftUI

struct BlurredImageWithTextView: View {
    let imageName: Image
    let title: String
    var width : CGFloat = 170
    var height : CGFloat = 186
    var body: some View {
        
        ZStack(alignment: .bottom) {
            imageName
                .frame(width: width, height: height)
                .cornerRadius(20)
            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 20, bottomTrailingRadius: 20, topTrailingRadius: 0)
                .frame(width: width, height: 45)
                .foregroundColor(.arrow3.opacity(0.5))
            BackdropBlurView(radius: 5)
                .frame(width: width-3, height: 45-5, alignment: .center)

            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .semibold))
                .frame(width: width, height: 45, alignment: .center)                
        }
    }
}

#Preview {
    BlurredImageWithTextView(imageName: Image("Tokyo"), title: "Tokyo", width: 170)
}

