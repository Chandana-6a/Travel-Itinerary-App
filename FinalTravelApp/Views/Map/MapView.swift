//
//  MapView.swift
//  Final Travel App
//
//  Created by chandana on 09/04/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .topLeading){
                Map()
                
                VStack(){
                    Rectangle()
                        .frame(height: 95, alignment: .top)
                        .foregroundColor(Color.white.opacity(0.8))
                        .overlay(
                            HStack {
                                Text("Maps")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                Spacer()
                                CircularppForScreens(imageUrl: viewModel.currentUser?.ppImageUrl)
                            }
                                .padding()
                                .padding(.bottom, -45)
                        )
                }
                
                LoginButtonView(action: "Directions", width: 129, destination: AnyView(MapSearchView()))
                    .padding(.top, 690)
                    .padding(.leading, 130)
                    .shadow(color: Color.loginButton.opacity(0.5), radius: 8, x: 0, y: 7)
                
            }
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
        
    }
    
}

#Preview {
    MapView()
}


