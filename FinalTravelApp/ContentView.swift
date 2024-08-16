//
//  ContentView.swift
//  Final Travel App
//
//  Created by chandana on 05/04/24.
//


import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                //if user is logged in HomePage
                BottomTabView()
            } else {
                //if user is logged out Authentication
                AuthView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}

