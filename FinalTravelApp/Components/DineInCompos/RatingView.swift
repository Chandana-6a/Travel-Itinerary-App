//
//  RatingView.swift
//  Final Travel App
//
//  Created by chandana on 11/04/24.
//

import SwiftUI

struct RatingView: View {

    let rating: Double // Assuming rating is between 0 and 5

    var body: some View {
        HStack {
            Text(String(format: "%.1f", rating))
                .font(.callout)
                .fontWeight(.semibold)
            
            ForEach(1...5, id: \.self) { index in
                if rating >= Double(index) - 0.5 && rating < Double(index) {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(.ratingyellow))
                } else if rating >= Double(index) {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(.ratingyellow))
                } else {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.arrow3)
                }
            }
            .font(.caption2)
            .frame(width: 10, height: 10)
        }
    }
}

#Preview {
    RatingView(rating: 4)
}
