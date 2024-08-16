//
//  CityView.swift
//  Final Travel App
//
//  Created by chandana on 12/04/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CityView: View {
    
    var data: Countries
    @ObservedObject var pm = PlaceDetailViewModel()
    @ObservedObject var searchModel = SearchViewModel()
    @ObservedObject private var weatherModel = WeatherViewModel()

    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                
                ScrollView {
                    let filteredImages = filterByCategory()
                    
                    VStack{
                        if filteredImages.isEmpty {
                            Text("No images available for this category")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            ForEach(filteredImages.indices, id: \.self) { index in
                                NavigationLink(destination: destination(for: filteredImages[index])) {
                                    PlaceImageView(
                                        imageName: URL(string: data.image[data.imageTitle.firstIndex(of: filteredImages[index])!]),
                                        title: filteredImages[index]
                                    )
                                }
                            }
                        }
                    }
                    .padding(.top, 150)
                }
                .scrollIndicators(.hidden)
                
                ZStack{
                    BackdropBlurView(radius: 5)
                        .frame(height: 205)
                    Rectangle()
                        .frame(height: 205, alignment: .top)
                        .foregroundColor(Color.white.opacity(0.6))
                        .overlay(
                            
                            VStack(spacing: 0) {
                                TitleLocationView(place: data.COCTitle, location: data.location, temperature: self.weatherModel.temperature, icon: self.weatherModel.icon)
                                
                                ScrollView(.horizontal) {
                                    HStack {
                                        CategoryButton(width: 65, action: "All", selectedCategory: $searchModel.selectedCategory)
                                        CategoryButton(width: 130, action: "Adventure", selectedCategory: $searchModel.selectedCategory)
                                        CategoryButton(width: 136, action: "Theme Parks", selectedCategory: $searchModel.selectedCategory)
                                        CategoryButton(width: 118, action: "Road Trips", selectedCategory: $searchModel.selectedCategory)
                                        CategoryButton(width: 92, action: "Cultural", selectedCategory: $searchModel.selectedCategory)
                                    }
                                }
                                .scrollIndicators(.hidden)
                                
                                .padding([.leading, .trailing], 20)
                            }
                            .padding(.top, 40)
                        )
                }
                .ignoresSafeArea()

            }
            .onAppear {
                weatherModel.fetchWeather(COCTitle: data.COCTitle)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    // Filter images based on the selected category
    func filterByCategory() -> [String] {
        if searchModel.selectedCategory == "All" {
            return data.imageTitle
        } else {
            return data.imageTitle.filter { title in
                if let index = data.imageTitle.firstIndex(of: title) {
                    return data.category[index] == searchModel.selectedCategory
                }
                return false
            }
        }
    }

    // Determine destination view based on image title
    func destination(for imageTitle: String) -> some View {
        if let place = pm.placeDetails.first(where: { $0.DTitle == imageTitle }) {
            return AnyView(APlaceDetailView(place: place))
        } else {
            return AnyView(Text("details unavailable")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                            .padding())
        }
    }
}
