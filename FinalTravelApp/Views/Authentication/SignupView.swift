//
//  SignupView.swift
//  Final Travel App
//
//  Created by chandana on 05/04/24.
//

import SwiftUI

struct SignupView: View {
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var conPassword = ""
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
                    Text("Create account")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    LoginInputsView(text: $username, placeholder: "Username")
                    LoginInputsView(text: $email, placeholder: "Email Address")
                        .autocapitalization(.none)
                    LoginInputsView(text: $password, placeholder: "Password", isSecureField: true)
                    ZStack(alignment: .trailing){
                        LoginInputsView(text: $conPassword, placeholder: "Confirm Password", isSecureField: true)
                        if !password.isEmpty && !conPassword.isEmpty{
                            if password == conPassword{
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemGreen))
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemRed))
                            }
                        }
                    }
                    
                    Button {
                        Task{
                            try await viewModel.createUser(withEmail: email, password: password, username: username)
                            print("account created")
                        }
                    } label: {
                        ActualLoginButton(actionName: "Submit", widthofButton: 155)
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
extension SignupView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && conPassword == password
        && !username.isEmpty
    }
}


#Preview {
    SignupView()
}

