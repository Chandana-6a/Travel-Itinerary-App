//
//  RestaANDarrowView.swift
//  Final Travel App
//
//  Created by chandana on 13/04/24.
//

import SwiftUI

struct RestaANDarrowView: View {
    var NameTitle: String
    var body: some View {
        HStack(spacing: 15) {
            Text(NameTitle)
                .font(.system(size: 32, weight: .bold))
                
            
            Image(systemName: "arrow.up.forward")
                .foregroundColor(.white)
                .frame(width: 26, height: 26)
                .font(.subheadline)
                .background(.arrow2)
                .cornerRadius(50)
                .padding(.trailing, 10)
        }
        .frame(width: 354, height: 29, alignment: .leading)
        .padding()
    }
}

#Preview {
    RestaANDarrowView(NameTitle: "restaurant")
}
