//
//  PhoneNumANDRatingView.swift
//  Final Travel App
//
//  Created by chandana on 13/04/24.
//

import SwiftUI

struct PhoneNumANDRatingView: View {
    var cellNum: String
    let ratingNumber: Double
    var body: some View {
        HStack(spacing: 35){
            HStack(spacing: 5){
                Image(systemName: "phone.fill")
                    .foregroundColor(.arrow2)
                Text(cellNum)
                    .font(.footnote)
            }
            .fontWeight(.semibold)
            
            HStack {
                Text(String(format: "%.1f", ratingNumber))
                    .font(.callout)
                    .fontWeight(.semibold)
                
                ForEach(1...5, id: \.self) { index in
                    if ratingNumber >= Double(index) - 0.5 && ratingNumber < Double(index) {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(.ratingyellow))
                    } else if ratingNumber >= Double(index) {
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

}
