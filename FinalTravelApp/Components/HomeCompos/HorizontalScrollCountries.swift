//
//  HorizontalScrollCountries.swift
//  Final Travel App
//
//  Created by chandana on 06/04/24.
//

import SwiftUI

struct HorizontalScrollCountries: View {
    
    private let pageCount = 4
    
    var body: some View {
        TabView() {
            ForEach(0..<4, id: \.self) { index in
                GeometryReader { geometry in
                    VStack(spacing: -40) {
                        switch index {
                        case 0:
                            VStack(spacing: -40) {
                                FirstpartHomeView(placeImage: Image("BhaliT"), miniDescri: "Bali is an Indonesian province known for Hindu culture and tourism.", Title: "Bhali", bottomColor: .bhaliBottom)
                                
                                VStack(spacing: -12) {
                                    TopDestination3cityView(cityTitle: "Ubud", FGarrowColor: .white, BGarrowColor: .arrow1, PageView: AnyView(UbudPageView()))
                                    TopDestination3cityView(cityTitle: "Nusa Dua", FGarrowColor: .white, BGarrowColor: .arrow2)
                                    TopDestination3cityView(cityTitle: "Mount Baur", FGarrowColor: .black, BGarrowColor: .arrow3)
                                }
                            }
                        case 1:
                            VStack(spacing: -40) {
                                FirstpartHomeView(placeImage: Image("Japan"), miniDescri: "Rich culture, advanced technology, stunning landscapes, delicious cuisine, traditional customs.", Title: "Japan", bottomColor: .japanBottom)
                                VStack(spacing: -12) {
                                    TopDestination3cityView(cityTitle: "Tokyo", FGarrowColor: .white, BGarrowColor: .arrow1)
                                    TopDestination3cityView(cityTitle: "Osaka", FGarrowColor: .white, BGarrowColor: .arrow2)
                                    TopDestination3cityView(cityTitle: "Mount Fuji", FGarrowColor: .black, BGarrowColor: .arrow3)
                                }
                            }
                        case 2:
                            VStack(spacing: -40) {
                                FirstpartHomeView(placeImage: Image("Italy"), miniDescri: "Rich history, stunning art, delicious cuisine, picturesque landscapes, vibrant culture.", Title: "Italy", bottomColor: .italyBottom)
                                VStack(spacing: -12) {
                                    TopDestination3cityView(cityTitle: "Rome", FGarrowColor: .white, BGarrowColor: .arrow1)
                                    TopDestination3cityView(cityTitle: "Venice", FGarrowColor: .white, BGarrowColor: .arrow2)
                                    TopDestination3cityView(cityTitle: "Amalfi Coast", FGarrowColor: .black, BGarrowColor: .arrow3)
                                }
                            }
                        case 3:
                            VStack(spacing: -40) {
                                FirstpartHomeView(placeImage: Image("France"), miniDescri: "Rich history, iconic landmarks, exquisite cuisine, diverse culture, picturesque landscapes.", Title: "France", bottomColor: .franceBottom)
                                VStack(spacing: -12) {
                                    TopDestination3cityView(cityTitle: "Paris", FGarrowColor: .white, BGarrowColor: .arrow1)
                                    TopDestination3cityView(cityTitle: "Versailles", FGarrowColor: .white, BGarrowColor: .arrow2)
                                    TopDestination3cityView(cityTitle: "French Riviera", FGarrowColor: .black, BGarrowColor: .arrow3)
                                }
                            }
                        default:
                            VStack(spacing: -40) {
                                FirstpartHomeView(placeImage: Image("BhaliT"), miniDescri: "Bali is an Indonesian province known for Hindu culture and tourism.", Title: "Bhali", bottomColor: .bhaliBottom)
                                
                                VStack(spacing: -12) {
                                    TopDestination3cityView(cityTitle: "Ubud", FGarrowColor: .white, BGarrowColor: .arrow1)
                                    TopDestination3cityView(cityTitle: "Nusa Dua", FGarrowColor: .white, BGarrowColor: .arrow2)
                                    TopDestination3cityView(cityTitle: "Mount Baur", FGarrowColor: .black, BGarrowColor: .arrow3)
                                }
                            }
                        }
                    }
                    .frame(width: geometry.size.width)
                    .clipped()
                }
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .ignoresSafeArea()
    }
}


#Preview {
    HorizontalScrollCountries()
}

