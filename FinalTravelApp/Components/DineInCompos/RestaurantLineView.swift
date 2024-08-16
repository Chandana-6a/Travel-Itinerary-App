//
//  RestaurantLineView.swift
//  Final Travel App
//
//  Created by chandana on 13/04/24.
//

import SwiftUI

struct RestaurantLineView: View {
    var foregroundColor : Color
    var body: some View {
        Rectangle()
            .frame(width: 190, height: 1)
            .foregroundColor(foregroundColor)
            .padding(.leading, 110)
    }
}

#Preview {
    RestaurantLineView(foregroundColor: .dividerRestau)
}
