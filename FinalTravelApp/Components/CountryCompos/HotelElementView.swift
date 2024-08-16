//
//  HotelElementView.swift
//  Final Travel App
//
//  Created by chandana on 13/04/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct HotelElementView: View {
    var hotelImage: URL?
    let numRating: Int
    var hotelName: String
    var hotelNumber: String
    var hotelboxwidth: CGFloat = 170
    
    var body: some View {
        
        ZStack {
            
            if let hotelImage = hotelImage{
                WebImage(url: hotelImage)
                    .resizable()
                    .frame(width: 354, height: 154)
                    .cornerRadius(10)
                
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 354, height: 154)
                    .cornerRadius(10)
                
            }
            
            ZStack(alignment: .leading){
                HStack{
                    ForEach(1...5, id: \.self) { index in
                        if numRating >= index {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color(.ratingyellow))
                                .font(.caption2)
                                .frame(width: 10, height: 10)
                                .fontWeight(.bold)
                        }
                        
                    }
                    Text(String(format: "\(numRating) Star Hotel"))
                        .font(.callout)
                        .fontWeight(.bold)
                }
            }
            .foregroundColor(.white)
            .font(.system(size: 20))
            .frame(width: hotelboxwidth, height: 30, alignment: .center)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
            .cornerRadius(30)
            .padding()
            .padding(.top, 100)
            .padding(.trailing, 170)
        }
        
        VStack{
            Text(hotelName)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .frame(width: 354, alignment: .leading)
            HStack(spacing: 5){
                Image(systemName: "phone.fill")
                    .foregroundColor(.arrow2)
                Text(hotelNumber)
                    .font(.footnote)
            }
            .fontWeight(.semibold)
            .frame(width: 354, alignment: .leading)
        }
        .padding(.bottom)
    }    
}


