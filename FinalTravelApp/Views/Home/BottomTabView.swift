//
//  BottomTabView.swift
//  Final Travel App
//
//  Created by chandana on 06/04/24.
//


import SwiftUI

struct BottomTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(0)
            
            NavigationStack {
                SearchView()
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .tag(1)
            
            NavigationStack {
                MapView()
            }
            .tabItem {
                Label("Maps", systemImage: "location.fill")
            }
            .tag(2)
        }
        .tint(.arrow2)
        .background(Color(.white.opacity(36)))
    }
}

#Preview {
    BottomTabView()
}


