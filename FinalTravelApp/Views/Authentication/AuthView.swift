//
//  AuthView.swift
//  Final Travel App
//
//  Created by chandana on 05/04/24.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationStack{
            ZStack{
                Image("inApp")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(){
                    VStack{
                        HStack(alignment: .center){
                            Text("Discover ")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white) +
                            Text("the world ")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        .frame(width: 300.0, height: 40.0, alignment: .leading)
                        Text("with us")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .frame(width: 300.0, height: 40.0, alignment: .leading)
                    }
                    .padding(.top, 180)
                    .padding(.leading, -8)
                    
                    
                    VStack(spacing: 14){
                        
                        // account sing in button
                        NavigationLink{
                            LoginView()
                        } label: {
                            Text("Sign In")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .frame(width: 268.0, height: 50.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.white, lineWidth: 2))
                        }
                        
                        // account creation button
                        LoginButtonView(action: "Create account", width: 268, destination: AnyView(SignupView()))
                    }
                    .padding(.top, 90)
                    
                    Spacer()
                    
                    // without account
                    NavigationLink{
                        BottomTabView()
                    } label: {
                        Text("continue without an account")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .padding(.bottom, 80)
                    }
                }
            }
        }
    }
}

#Preview {
    AuthView()
}
    
