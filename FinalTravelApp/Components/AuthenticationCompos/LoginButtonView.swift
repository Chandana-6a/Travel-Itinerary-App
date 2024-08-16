//
//  LoginButtonView.swift
//  Final Travel App
//
//  Created by chandana on 05/04/24.
//

import SwiftUI

struct LoginButtonView: View {
    
    let action: String
    var width: CGFloat = 155
    var destination: AnyView? = AnyView(
        Text("unavailable")
            .font(.largeTitle)
            .foregroundColor(.gray)
            .padding()
    )
    
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: destination) {
                    Text(action)
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(width: width, height: 50)
                        .background(Color.loginButton)
                        .cornerRadius(40)
                }
            }
        }
    }
}

#Preview {
    LoginButtonView(action: "skip")
}

