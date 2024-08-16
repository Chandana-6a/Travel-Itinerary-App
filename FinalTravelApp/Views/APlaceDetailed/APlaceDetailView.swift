//
//  APlaceDetailView.swift
//  Final Travel App
//
//  Created by chandana on 13/04/24.
//

import SwiftUI

struct APlaceDetailView: View {

    var place: PlaceDets
    var body: some View {
        NavigationStack{
            ZStack(alignment: .top){
                ScrollView{
                    PlaceImageElementView(imagePlace: URL(string: place.DImage))
                        .padding(.top, 100)
                    PhoneNumANDRatingView(cellNum: place.DPhNo, ratingNumber: place.DRating)
                        .padding(.top, 15)
                    AboutANDescripView(descr: place.DDesc)
                        .padding()
                    MiniMapView(Name: place.DCityTitle)

                }
                .scrollIndicators(.hidden)
                
                TitleANDlocationView(placeTitle: place.DCityTitle, locationTitle: place.DTitle, placeTypeTitle: place.DType)
                    .ignoresSafeArea()
            }

        }
        .navigationBarBackButtonHidden(true)
    }
    
}


