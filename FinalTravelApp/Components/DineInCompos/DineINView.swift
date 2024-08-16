//
//  DineINView.swift
//  Final Travel App
//
//  Created by chandana on 20/04/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct DineINView: View {
    var uimageName: URL?
    var urestaurantName: String
    var uphoneNum: String
    let uratingNum: Double
    
    var ushowDineIn: String?
    var ushowTakeaway: String?
    var ushowDelivery: String?
    var urestaurantType: String

    var body: some View {
        HStack(spacing: 12) {
            if let uimageName = uimageName {
                WebImage(url: uimageName)
                    .resizable()
                    .frame(width: 122, height: 122)
                    .cornerRadius(10)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 122, height: 122)
                    .cornerRadius(10)
            }
            
            VStack(spacing: 5) {
                VStack {
                    Text(urestaurantName)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .frame(width: 205, alignment: .leading)
                    
                    HStack(spacing: 5) {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.arrow2)
                        Text(uphoneNum)
                            .font(.footnote)
                    }
                    .fontWeight(.semibold)
                    .frame(width: 205, alignment: .leading)
                }
                
                HStack {

                    Text(String(format: "%.1f", NSDecimalNumber(decimal: Decimal(uratingNum)).doubleValue))
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                        ForEach(1...5, id: \.self) { index in
                            if uratingNum >= Double(index) - 0.5 && uratingNum < Double(index) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color(.ratingyellow))
                            } else if uratingNum >= Double(index) {
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
                    Text((ushowDineIn ?? "") + (ushowTakeaway ?? "") + (ushowDelivery ?? ""))
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundColor(.dineIn)
                        .frame(width: 205, alignment: .leading)
                    
                    Text(urestaurantType)
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundColor(.dineIn)
                        .frame(width: 205, alignment: .leading)
                }
            }
            .frame(width: 216, height: 108, alignment: .leading)
        }
        .foregroundColor(.black)
    }
}
