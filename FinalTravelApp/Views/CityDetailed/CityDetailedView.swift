//
//  CityDetailedView.swift
//  Final Travel App
//
//  Created by chandana on 12/04/24.
//

import SwiftUI

struct CityDetailedView: View {
    var city: CityDets
    @ObservedObject var pm = PlaceDetailViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                ScrollView {
                    ScrollView(.horizontal) {
                        HStack {
                            ReflecImageWebUrl(bottomImage: URL(string: city.imagesArr[0]))
                                .padding(.leading, 20)
                            ForEach(city.imagesArr.indices.suffix(3), id: \.self) { index in
                                ReflecImageWebUrl(bottomImage: URL(string: city.imagesArr[index]))
                            }
                        }
                        .padding(.trailing, 10)
                        .padding(.top, 95)
                    }
                    .scrollIndicators(.hidden)
                    
                    AboutANDescripView(descr: city.miniDesc)
                    
                    RestaANDarrowView(NameTitle: city.PlacesIn)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            VStack(spacing: 0) {
                                ForEach(city.RImage.indices.prefix(3), id:\.self) { index in
                                    NavigationLink(destination: {
                                      Group {
                                        if let place = pm.placeDetails.first(where: { $0.DTitle == city.PlTitle[index] }) {
                                          APlaceDetailView(place: place)
                                        } else {
                                          Text("Destination details unavailable")
                                        }
                                      }
                                    }) {
                                        DineINView(
                                            uimageName: URL(string: city.PlImages[index]),
                                            urestaurantName: city.PlTitle[index],
                                            uphoneNum: city.PlPhNo[index],
                                            uratingNum: Double(city.PlRating[index]),
                                            urestaurantType: city.PlType[index]
                                        )
                                        .padding([.top, .bottom], 10)
                                    }
                                      RestaurantLineView(foregroundColor: .dividerRestau)
                                }
                            }.padding(.leading, 20)

                            VStack(spacing: 0) {
                                ForEach(city.PlImages.indices.suffix(3), id: \.self) { index in
                                    NavigationLink(destination: {
                                      Group {
                                        if let place = pm.placeDetails.first(where: { $0.DTitle == city.PlTitle[index] }) {
                                          APlaceDetailView(place: place)
                                        } else {
                                          Text("Destination details unavailable")
                                        }
                                      }
                                    }) {
                                        DineINView(
                                            uimageName: URL(string: city.PlImages[index]),
                                            urestaurantName: city.PlTitle[index],
                                            uphoneNum: city.PlPhNo[index],
                                            uratingNum: Double(city.PlRating[index]),
                                            urestaurantType: city.PlType[index]
                                        )
                                        .padding([.top, .bottom], 10)
                                    }
                                        RestaurantLineView(foregroundColor: .dividerRestau)
                                }
                            }
                        }.overlay(Rectangle().frame(height: 1).foregroundColor(.white), alignment: .bottomTrailing)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.top, -15)
                    
                    RestaANDarrowView(NameTitle: "Restaurants")
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            VStack(spacing: 0) {
                                ForEach(city.RImage.indices.prefix(3), id: \.self) { index in
                                    DineINView(
                                        uimageName: URL(string: city.RImage[index]),
                                        urestaurantName: city.RTitle[index],
                                        uphoneNum: city.RPhNo[index],
                                        uratingNum: Double(city.RRating[index]),
                                        ushowDineIn: city.DineIn[index],
                                        ushowTakeaway: city.RTakeAway[index],
                                        ushowDelivery: city.RDelivery[index],
                                        urestaurantType: city.RType[index]
                                    ).padding([.top, .bottom], 10)
                                    RestaurantLineView(foregroundColor: .dividerRestau)
                                }
                            }.padding(.leading, 20)
                            
                            VStack(spacing: 0) {
                                ForEach(city.RImage.indices.suffix(3), id: \.self) { index in
                                    DineINView(
                                        uimageName: URL(string: city.RImage[index]),
                                        urestaurantName: city.RTitle[index],
                                        uphoneNum: city.RPhNo[index],
                                        uratingNum: Double(city.RRating[index]),
                                        ushowDineIn: city.DineIn[index],
                                        ushowTakeaway: city.RTakeAway[index],
                                        ushowDelivery: city.RDelivery[index],
                                        urestaurantType: city.RType[index]
                                    ).padding([.top, .bottom], 10)
                                    RestaurantLineView(foregroundColor: .dividerRestau)
                                }
                            }
                        }.overlay(Rectangle().frame(height: 1).foregroundColor(.white), alignment: .bottomTrailing)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.top, -15)
                
                    RestaANDarrowView(NameTitle: "Hotels")
                    if !city.HImage.isEmpty {
                        ForEach(city.HImage.indices) { index in
                            HotelElementView(
                                hotelImage: URL(string: city.HImage[index]),
                                numRating: city.HStar[index],
                                hotelName: city.HTitle[index],
                                hotelNumber: city.HPhNo[index]
                            )
                        }
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.dividerRestau)
                        .padding([.leading, .trailing])
                    
                    
                    MiniMapView(Name: city.CTitle)
                }
                .scrollIndicators(.hidden)
                
                TitleANDlocationView(placeTitle: city.CTitle, locationTitle: city.CsubTitle)
                    .ignoresSafeArea()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

