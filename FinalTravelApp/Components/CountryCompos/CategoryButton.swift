//
//  CategoryButton.swift
//  Final Travel App
//
//  Created by chandana on 16/08/24.
//

import SwiftUI

struct CategoryButton: View {
    var width: CGFloat = 155
    var action: String
    @Binding var selectedCategory: String
    
    var body: some View {
        Button(action: {
            selectedCategory = action
        }) {
            Text(action)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .regular))
                .padding()
                .frame(width: width, height: 34)
                .background(selectedCategory == action ? Color.arrow2 : Color.black)
            .cornerRadius(30)    }
    }
}
