//
//  FirstpartHomeView.swift
//  Final Travel App
//
//  Created by chandana on 06/04/24.
//

import SwiftUI

struct FirstpartHomeView: View {

    var placeImage : Image
    var miniDescri : String
    var Title : String
    var bottomColor : Color
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .topLeading){
                placeImage
                    .ignoresSafeArea()
                    .frame(alignment: .topLeading)
                                
                VStack(spacing: 0){
                    Text(miniDescri)
                        .font(.system(size: 10))
                        .fontWeight(.medium)
                        .foregroundStyle(Color(.white))
                        .frame(width: 350, height: 25, alignment: .bottomLeading)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, -20)
                    
                    HStack{
                        Text(Title)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .frame(width: 110, height: 42, alignment: .center)
                            .background(.ultraThinMaterial)
                            .cornerRadius(40)

                        Image(systemName: "arrow.up.forward")
                            .foregroundColor(.white)
                            .frame(width: 37, height: 37)
                            .font(.title2)
                            .background(.ultraThinMaterial)
                            .cornerRadius(50)
                    }
                    .padding(15)
                    .frame(width: 390, height: 65, alignment: .leading)
                    
                    HStack(spacing: 0){
                        HStack(spacing: 0){
                            Text("Top destination in ")
                            Text(Title)
                                .frame(alignment: .leading)
                        }
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("see all")
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                            .frame(width: 67, height: 25)
                            .background(.black)
                            .cornerRadius(20)
                    }
                    .padding(15)
                    .frame(width: 390, height: 47, alignment: .leading)
                    .background(bottomColor)
                    .padding(.top, 15)
                }
                .frame(width: 390, height: 240)
                .padding(.top, 240)
            }
        }
    }
}

#Preview {
    FirstpartHomeView(placeImage: Image("BhaliT"), miniDescri: "Rich culture, advanced technology, stunning landscapes, delicious cuisine, traditional customs.", Title: "Bhali", bottomColor: .bhaliBottom)
}


