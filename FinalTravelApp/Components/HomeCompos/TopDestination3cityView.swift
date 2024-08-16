//
//  TopDestination3cityView.swift
//  Final Travel App
//
//  Created by chandana on 06/04/24.
//

import SwiftUI

struct TopDestination3cityView: View {
    var cityTitle : String
    var FGarrowColor : Color
    var BGarrowColor : Color
    var PageView : AnyView? = AnyView(
        Text("unavailable")
            .font(.largeTitle)
            .foregroundColor(.gray)
            .padding()
    )
    var body: some View {
        NavigationStack{
            VStack(spacing: 15){
                HStack(spacing : 0){
                    Text(cityTitle)
                        .bold()
                        .font(.system(size: 24))
                        .frame(width: 330, height: 20, alignment: .leading)
                    
                    NavigationLink(destination: PageView) {
                        
                        Image(systemName: "arrow.up.forward")
                            .foregroundColor(FGarrowColor)
                            .frame(width: 35, height: 35)
                            .font(.title2)
                            .background(BGarrowColor)
                            .cornerRadius(50)
                            .padding(.trailing, 10)
                            .frame(width: 20, height: 20, alignment: .center)
                    }
                }
                Rectangle()
                    .frame(height: 1)
            }
            .padding()
        }
    }
}




