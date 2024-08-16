//
//  HomeView.swift
//  Final Travel App
//
//  Created by chandana on 06/04/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .top) {
                    ScrollView {
                        VStack {
                            HorizontalScrollCountries()
                                .frame(height: 640)
                                .ignoresSafeArea()
                        }
                        
                        LoginButtonView(action: "Featured Cities", width: 167)
                            .padding(.top, -20)
                        
                        featuredCitiesView()
                        
                        LoginButtonView(action: "Featured Countries", width: 197)
                        
                        featuredCountriesView()
                        
                        Image("HomeBottomIndia")
                    }
                    .scrollIndicators(.hidden)
                    
                    VStack {
                        // Fixed content at the top - header
                        ZStack{
                            BackdropBlurView(radius: 10)
                                .frame(height: 100)
                            Rectangle()
                                .frame(height: 100, alignment: .top)
                                .foregroundColor(Color.white.opacity(0.6))
                                .overlay(
                                    HStack {
                                        Text("Home")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                        Spacer()
                                        
                                        // user profile
                                        CircularppForScreens(imageUrl: viewModel.currentUser?.ppImageUrl)
                                    }
                                    .padding()
                                    .padding(.bottom, -50)
                                )
                        }
                    }
                }
                .ignoresSafeArea()
            }
            
        }
        .navigationBarHidden(true)
    }
}


#Preview{
    HomeView()
}
