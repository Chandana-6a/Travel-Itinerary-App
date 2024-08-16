
//  TitleLocationView.swift
//  Final Travel App
//
//  Created by chandana on 12/04/24.


import SwiftUI

struct TitleLocationView: View {
    
    var place: String
    var location: String
    let temperature: Double
    let icon: String
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 2) {
                HStack{
                    VStack {
                        Text(place)
                            .font(.system(size: 40))
                            .foregroundStyle(Color(.black))
                            .fontWeight(.black)
                            .frame(width: 310, alignment: .leading)

                        Text(location)
                            .font(.system(size: 10))
                            .fontWeight(.regular)
                            .foregroundColor(.location)
                            .frame(width: 310, alignment: .leading)

                    }
                    Spacer()
                    CircularppForScreens(imageUrl: viewModel.currentUser?.ppImageUrl)
                }
                
                
                HStack(spacing: 10){
                    
                    Text("\(temperature.roundDouble())°C")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.arrow2)
                    
                    if let url = URL(string: "https://openweathermap.org/img/w/\(icon).png") {
                        AsyncImage(url: url)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                    }
                }
                .frame(width: 355, alignment: .leading)
                
            }
            .padding([.leading, .trailing], 20)
            .padding(.bottom, 5)
        }
    }
}



extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}
