//
//  ProfileView.swift
//  Final Travel App
//
//  Created by chandana on 14/04/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View{
    @StateObject var profileViewModel = ProfilePhotoViewModel()
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationStack{
                ZStack{
                    VStack{
                        // displays user profileImage
                        PhotosPicker(selection: $profileViewModel.selectedItem){
                            if let profileImage = profileViewModel.profileImage{
                                ZStack{
                                    profileImage
                                        .resizable()
                                        .frame(height: 320)
                                    
                                    Button("save") {
                                        Task { try await profileViewModel.updateUserData()
                                            print("upload done")
                                        }
                                    }
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(.edit)
                                    .frame(width: 70, height: 25)
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(20)
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 0.75))
                                    .padding(.top, -100)
                                    .padding(.leading, 270)
                                    

                                    VStack(spacing: 0){
                                        Text("username")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .light))
                                            .padding(.leading)
                                            .frame(width: 364, alignment: .leading)
                                        Text(user.username)
                                            .font(.system(size: 40, weight: .bold))
                                            .padding(.leading)
                                            .frame(width: 364, alignment: .leading)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.top, 170)
                                }
                                
                            } else {
                                ZStack{
                                    // uploads profile image to their account
                                    ppForProfileView(imageUrl: user.ppImageUrl)
                                    
                                    Button("save") {
                                        Task { try await profileViewModel.updateUserData()
                                            print("upload done")
                                        }
                                    }
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(.edit)
                                    .frame(width: 70, height: 25)
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(20)
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 0.75))
                                    .padding(.top, -100)
                                    .padding(.leading, 270)
                                    
                                }
                            }
                                
                        }.frame(height:322)
                            .padding(.top, -415)
                            .ignoresSafeArea()
                    }
                    ZStack{
                        BackdropBlurView(radius: 10)
                            .frame(height: 200)
                            .padding(.top, -280)
                        
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 23, topTrailing: 23))
                            .foregroundColor(.profileRect)
                            .opacity(0.725)
                            .overlay(
                                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 23, topTrailing: 23))
                                    .stroke(Color.white, lineWidth: 2) // Adjust lineWidth as needed
                            )
                            .frame(height: 560)
                        
                        VStack(spacing:0) {
                            
                            VStack{
                                Text("E-mail address")
                                    .foregroundColor(.emailfont)
                                    .font(.system(size: 15, weight: .light))
                                    .padding(.leading)
                                    .frame(width: 344, alignment: .leading)
                                Text(user.email)
                                    .font(.system(size: 18, weight: .medium))
                                    .padding(.leading)
                                    .frame(width: 344, height: 54, alignment: .leading)
                                    .foregroundColor(.emailfillfont)
                                    .background(.emailbox)
                                    .cornerRadius(10)
                            }
                            
                            NavigationLink(destination: HomeView()){
                                HStack(spacing: 12) {
                                    Image(systemName: "arrow.left")
                                        .frame(width: 35, height: 35)
                                        .font(.title3)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .background(.arrow1)
                                        .cornerRadius(50)
                                    Text("Back to home page")
                                        .font(.system(size: 24, weight: .black))
                                        .foregroundColor(.black)
                                }
                                .padding(.top, 30)
                                .padding(.bottom, 155)
                            }
                            
                            VStack{
                                Button{
                                    viewModel.signOut()
                                } label: {
                                    Text("Sign out")
                                        .font(.system(size: 18, weight: .medium))
                                        .frame(width: 276, height: 58)
                                        .foregroundColor(.white)
                                        .background(.arrow2)
                                        .cornerRadius(10)
                                }
                                Button{
                                    Task {
                                        await viewModel.deleteAccountAsync()
                                    }
                                } label: {
                                    Text("Delete account")
                                        .font(.system(size: 18, weight: .medium))
                                        .frame(width: 276, height: 58)
                                        .foregroundColor(.white)
                                        .background(.deleteAccount)
                                        .cornerRadius(10)
                                }                                
                            }
                            .padding(.bottom, 95)
                        }
                    }
                    .padding(.bottom, -320)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
