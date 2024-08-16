//
//  ActualLoginButton.swift
//  Final Travel App
//
//  Created by chandana on 14/04/24.
//

import SwiftUI

struct ActualLoginButton: View {
    let actionName: String
    var widthofButton: CGFloat = 155
    
    var body: some View {
        NavigationStack{
            VStack{
                Text(actionName)
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(width: widthofButton, height: 50)
                    .background(Color.loginButton)
                    .cornerRadius(40)
                
            }
        }
    }
}

#Preview {
    ActualLoginButton(actionName: "log", widthofButton: 150)
}
