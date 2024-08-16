//
//  Search.swift
//  Final Travel App
//
//  Created by chandana on 08/04/24.
//

import SwiftUI
import Firebase

struct SearchView: View {
    @ObservedObject var Model = SearchViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    ScrollView {
                        HorizontalScrollCountries()
                            .frame(height: 640)

                        LoginButtonView(action: "Featured Cities", width: 167)
                            .padding(.top, -20)

                        featuredCitiesView()

                        LoginButtonView(action: "Featured Countries", width: 197)

                        featuredCountriesView()

                        Image("HomeBottomIndia")
                    }
                    .scrollIndicators(.hidden)
                    .ignoresSafeArea()

                    VStack(spacing: 0) {
                        // Fixed content at the top
                        SearchBarView(data: $Model.CountriesTitles, searchText: $Model.searchText, Model: Model)
                            .padding(.top, -17)
                            .frame(width: 390, height: 110)
                            .background(.ultraThinMaterial)
                            .zIndex(1)

                        if !Model.searchText.isEmpty {
                            SearchListView(data: Model.CountriesTitles, searchText: $Model.searchText, Model: Model)
                                .padding()
                                .padding(.top, -15)
                                
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// searchBar UI
struct SearchBarView: View {
    @Binding var data: [Countries]
    @Binding var searchText: String
    var Model: SearchViewModel

    var body: some View {
        VStack {
            Text("Search")
                .font(.system(size: 30))
                .fontWeight(.black)
                .frame(width: 365, alignment: .leading)
                .padding(.bottom, -5)

            HStack {
                NavigationLink(destination: BottomTabView()) {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(height: 48)
                }

                TextField("Search for places ", text: $searchText)
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
                    .keyboardType(.alphabet)
                    .frame(width: 260)

                Image(systemName: "magnifyingglass")
                    .font(.title)
            }
            .padding()
            .frame(width: 365, height: 48)
            .background(Color.white)
            .cornerRadius(34)
            .padding(.bottom, -10)
        }
    }
}

struct SearchListView: View {
    var data: [Countries]
    @Binding var searchText: String
    var Model: SearchViewModel

    var body: some View {
        //when searchText is equal to data available in database
        let filteredData = data.filter { $0.COCTitle.lowercased().contains(searchText.lowercased()) }

        if filteredData.isEmpty {
            Text("No results found")
        } else {
            GeometryReader { geometry in
                // found data is displayed in form of list
                List(filteredData) { country in
                    NavigationLink(destination: destinationView(for: country)) {
                        Text(country.COCTitle)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(5).padding(5)
                            .frame(width: geometry.size.width - 40, alignment: .leading)
                    }
                }
                .listStyle(.plain)
                .frame(height: geometry.size.height)
            }
        }
    }

    func destinationView(for country: Countries) -> some View {
        if !Model.isCityLogic(country.type) { 
            // If not a city, navigates to CountryView
            return AnyView(CountryView(country: country))
        } else { 
            // If a city, navigates to CityView
            return AnyView(CityView(data: country))
        }
    }
}

#Preview{
    SearchView()
}


