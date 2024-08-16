//
//  LoginView.swift
//  Final Travel App
//
//  Created by chandana on 05/04/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("inApp")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .padding([.leading, .top, .trailing], -10 )
                    .blur(radius: 10)
                
                VStack(alignment: .leading){
                    Text("Sign In")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .autocapitalization(.none)
                    
                    
                    LoginInputsView(text: $email, placeholder: "Email Address")
//                        .textInputAutocapitalization(.none)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    LoginInputsView(text: $password, placeholder: "Password", isSecureField: true)
                    
                    
                    // sign in button
                    Button {
                        Task{
                            try await viewModel.signIn(withEmail: email, password: password)
                        }
                    } label: {
                        ActualLoginButton(actionName: "login", widthofButton: 154)
                            .padding(.leading, 75.0)
                            .padding()
                    }
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                }
            }
        }
    }
}

//authentication protocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
