//
//  DineInTakeAwayElementView.swift
//  Final Travel App
//
//  Created by chandana on 13/04/24.
//


import SwiftUI
import SDWebImageSwiftUI

struct DineInTakeAwayElementView: View {
    
    var imageName: Image
    var restaurantName: String
    var phoneNum: String
    let ratingNum: Double
    
    var showDineIn: String?
    var showTakeaway: String?
    var showDelivery: String?
    
    var custTakeaway: String?
    var cusDelivery: String?
    
    var restaurantType: String
    
    var body: some View {
        HStack(spacing: 12) {
            
            imageName
                .resizable()
                .frame(width: 122, height: 122)
                .cornerRadius(10)
            
            VStack(spacing: 5) {
                VStack {
                    Text(restaurantName)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .frame(width: 205, alignment: .leading)
                    
                    HStack(spacing: 5) {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.arrow2)
                        Text(phoneNum)
                            .font(.footnote)
                    }
                    .fontWeight(.semibold)
                    .frame(width: 205, alignment: .leading)
                }
                
                HStack {
                    Text(String(format: "%.1f", NSDecimalNumber(decimal: Decimal(ratingNum)).doubleValue))
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    ForEach(1...5, id: \.self) { index in
                        if ratingNum >= Double(index) - 0.5 && ratingNum < Double(index) {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color(.ratingyellow))
                        } else if ratingNum >= Double(index) {
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
                .frame(width: 205, alignment: .leading)
                
                VStack() {
                    Text((showDineIn ?? "") + (showTakeaway ?? "") + (showDelivery ?? ""))
                    
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundColor(.dineIn)
                        .frame(width: 205, alignment: .leading)
                    
                    Text(restaurantType)
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundColor(.dineIn)
                        .frame(width: 205, alignment: .leading)
                }
            }
            .frame(width: 216, height: 108, alignment: .leading)
        }
    }
}


