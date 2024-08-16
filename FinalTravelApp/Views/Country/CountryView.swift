//
//  CountryView.swift
//  Final Travel App
//
//  Created by chandana on 11/04/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CountryView: View {
    var country: Countries
    @ObservedObject var vm = CDetailViewModel()
    @ObservedObject var searchViewModel = SearchViewModel()
    @ObservedObject private var weatherVM = WeatherViewModel()


    var body: some View {
        NavigationStack {
            
            ZStack(alignment: .top){
                
                // Displays filtered places
                ScrollView {
                    let filteredImages = filterImagesByCategory()
                    
                    VStack{
                        if filteredImages.isEmpty {
                            Text("No images available for this category")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            ForEach(filteredImages.indices, id: \.self) { index in
                                NavigationLink(destination: destinationView(for: filteredImages[index])) {
                                    PlaceImageView(
                                        imageName: URL(string: country.image[country.imageTitle.firstIndex(of: filteredImages[index])!]),
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
                                TitleLocationView(place: country.COCTitle, location: country.location, temperature: self.weatherVM.temperature, icon: self.weatherVM.icon)
                                
                                // Category buttons for filtering
                                ScrollView(.horizontal) {
                                    HStack {
                                        CategoryButton(width: 65, action: "All", selectedCategory: $searchViewModel.selectedCategory)
                                        CategoryButton(width: 130, action: "Adventure", selectedCategory: $searchViewModel.selectedCategory)
                                        CategoryButton(width: 136, action: "Theme Parks", selectedCategory: $searchViewModel.selectedCategory)
                                        CategoryButton(width: 118, action: "Road Trips", selectedCategory: $searchViewModel.selectedCategory)
                                        CategoryButton(width: 92, action: "Cultural", selectedCategory: $searchViewModel.selectedCategory)
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
                // Fetches weather data when the view appears
                weatherVM.fetchWeather(COCTitle: country.COCTitle)
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    // Filter images based on the selected category
    func filterImagesByCategory() -> [String] {
        if searchViewModel.selectedCategory == "All" {
            return country.imageTitle
        } else {
            return country.imageTitle.filter { title in
                if let index = country.imageTitle.firstIndex(of: title) {
                    return country.category[index] == searchViewModel.selectedCategory
                }
                return false
            }
        }
    }

    // Determine destination view based on image title
    func destinationView(for imageTitle: String) -> some View {
        if let city = vm.cityDetails.first(where: { $0.CTitle == imageTitle }) {
            return AnyView(CityDetailedView(city: city))
        } else {
            return AnyView(Text("City details unavailable")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                            .padding())
        }
    }
}
