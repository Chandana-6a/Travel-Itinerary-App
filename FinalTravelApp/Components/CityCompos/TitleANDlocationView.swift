
//  TitleANDlocationView.swift
//  Final Travel App
//
//  Created by chandana on 11/04/24.
//

import SwiftUI

struct TitleANDlocationView: View {
    var placeTitle: String
    var locationTitle: String
    var placeTypeTitle: String?
    
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
    VStack{
        ZStack{
            BackdropBlurView(radius: 10)
                .frame(height: 145)
            
                Rectangle()
                    .frame(height: 145, alignment: .bottomLeading)
                    .foregroundColor(Color.white.opacity(0.6))
                    .overlay(
                        HStack{
                            VStack (spacing: 4){
                                Text(placeTitle)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .frame(width: 310, alignment: .leading)
                                Text(locationTitle)
                                    .font(.system(size: 20))
                                    .fontWeight(.regular)
                                    .frame(width: 310, alignment: .leading)
                                
                                if let placeTypeTitle = placeTypeTitle {
                                    Text(placeTypeTitle)
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                        .frame(width: 310, alignment: .leading)
                                        .foregroundColor(.arrow1)
                                }
                            }
                            
                            Spacer()
                            
                            CircularppForScreens(imageUrl: viewModel.currentUser?.ppImageUrl)
                            
                        }
                            .padding()
                            .padding(.top, 30)
                    )
            }
            
        }
    }
}

