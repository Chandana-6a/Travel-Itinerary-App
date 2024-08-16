//
//  CircularppForScreens.swift
//  Final Travel App
//
//  Created by chandana on 27/04/24.
//
//

import SwiftUI
import Kingfisher

struct CircularppForScreens: View {
    @StateObject var profileViewModel = ProfilePhotoViewModel()
    @EnvironmentObject var viewModel: AuthViewModel
    var imageUrl: String?
    
    var body: some View {
        NavigationLink(destination: ProfileView()){
            if let user = viewModel.currentUser{
                if let imageUrl = imageUrl {
                    KFImage(URL(string: imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}



struct ppForProfileView: View{
    @StateObject var profileViewModel = ProfilePhotoViewModel()
    @EnvironmentObject var viewModel: AuthViewModel
    
    var imageUrl: String?
    var body: some View{
        
        if let user = viewModel.currentUser{
            
                if let imageUrl = imageUrl {
                    ZStack{
                    KFImage(URL(string: imageUrl))
                        .resizable()
                        .frame(height: 320)
        
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
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame( width: 120, height: 120)
                        .foregroundColor(.gray)
                    

                    VStack(spacing: 0){
                        Text("username")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .light))
                            .padding(.leading)
                            .frame(width: 364, alignment: .leading)
                        Text(user.username)
                            .font(.system(size: 40, weight: .bold))
                            .padding(.leading)
                            .frame(width: 364, alignment: .leading)
                            .foregroundColor(.black)
                    }
                    .padding(.top, 170)
                }
            }
        }
    }
}

