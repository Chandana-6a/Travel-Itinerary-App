//
//  featuredCountriesView.swift
//  Final Travel App
//
//  Created by chandana on 06/04/24.
//

import SwiftUI

struct featuredCountriesView: View {
    var body: some View {
        NavigationStack{
            VStack {
                VStack(spacing: 13) {
                    BlurredImageWithTextView(imageName: Image("India"), title: "India", width: 352)
                    BlurredImageWithTextView(imageName: Image("Switzerland"), title: "Switzerland", width: 352)
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


#Preview {
    featuredCountriesView()
}

