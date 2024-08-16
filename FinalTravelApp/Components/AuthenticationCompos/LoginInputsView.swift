//
//  LoginInputsView.swift
//  Final Travel App
//
//  Created by chandana on 05/04/24.
//

import SwiftUI

struct LoginInputsView: View {
    @Binding var text: String
    let placeholder: String
    var isSecureField = false
    let inputWidth: CGFloat = 320
    let inputHeight: CGFloat = 50
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            if isSecureField {
                SecureField(placeholder, text: $text)
            }
            else {
                TextField(placeholder, text: $text)
                   
            }
        }
        .padding()
        .fontWeight(.medium)
        .font(.system(size: 18))
        .foregroundColor(Color(.loginCredentials))
        .frame(width: inputWidth, height: inputHeight)
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
     

    }
}


#Preview {
    LoginInputsView(text: .constant(""), placeholder: "email")
}
