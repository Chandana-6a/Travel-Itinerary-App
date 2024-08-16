//
//  featuredCitiesView.swift
//  Final Travel App
//
//  Created by chandana on 06/04/24.
//

import SwiftUI

struct featuredCitiesView: View {
    var body: some View {
        NavigationStack{
            VStack {
                VStack {
                    HStack {
                       BlurredImageWithTextView(imageName: Image("Seoul"), title: "Seoul")
                        BlurredImageWithTextView(imageName: Image("Tokyo"), title: "Tokyo")
                    }
                    
                    HStack {
                        BlurredImageWithTextView(imageName: Image("Singapoor"), title: "Singapoor")
                        BlurredImageWithTextView(imageName: Image("New York"), title: "New York")
                    }
                }
                
                
                Text("more")
                    .foregroundStyle(Color.loginButton)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 5)
                
                Rectangle()
                    .frame(height: 1)
            }
            .padding()
        }
    }
}

#Preview {
    featuredCitiesView()
}
