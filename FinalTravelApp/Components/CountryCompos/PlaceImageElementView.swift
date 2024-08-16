//
//  PlaceImageElementView.swift
//  Final Travel App
//
//  Created by chandana on 13/04/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlaceImageElementView: View {
    var imagePlace: URL?
    
    var body: some View {
        NavigationStack{
            ZStack{
                if let imagePlace = imagePlace{
                    WebImage(url: imagePlace)
                        .resizable()
                        .frame(width: 354, height: 250)
                        .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 3)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 354, height: 250)
                        .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 3)
                }
                HStack{
                    Text("Photos")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 100, height: 36, alignment: .center)
                        .background(.whiteShadeBhali.opacity(0.5))
                        .cornerRadius(30)
                    
                    Image(systemName: "arrow.up.forward")
                        .foregroundColor(.white)
                        .frame(width: 31, height: 31)
                        .font(.callout)
                        .background(.black)
                        .cornerRadius(50)
                }
                .frame(width: 390, height: 65)
                .padding(.leading, -200)
                .padding(.top, 180)
            }
        }
    }
}
