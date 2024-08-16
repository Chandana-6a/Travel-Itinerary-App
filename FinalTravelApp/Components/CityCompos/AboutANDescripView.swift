//
//  AboutANDescripView.swift
//  Final Travel App
//
//  Created by chandana on 13/04/24.
//

import SwiftUI

struct AboutANDescripView: View {

    var descWidth: CGFloat = 350
    var descr: String
    var body: some View {
        VStack(alignment: .leading ,spacing: 0){
            Text("About")
                .font(.system(size: 32, weight: .bold))
            
            Text(descr)
                .font(.callout)
                .fontWeight(.regular)
                .frame(width: descWidth, alignment: .leading)
                .fixedSize(horizontal: true, vertical: false)
                .lineLimit(nil)
        }
        .frame(width: 350, alignment: .leading)
    }
}

#Preview {
    AboutANDescripView(descr: "The capital and largest city of South Korea, Seoul is a vibrant metropolis known for its modern skyscrapers, historical landmarks, bustling street markets, and thriving nightlife. It's also a major center for technology, finance, and culture.")
}
