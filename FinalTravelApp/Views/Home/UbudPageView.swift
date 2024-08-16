//
//  TopDestinyPlacesView.swift
//  Final Travel App
//
//  Created by chandana on 09/04/24.
//

import SwiftUI

struct UbudPageView: View {
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack(alignment: .top){
                    ScrollView{
                        ScrollView(.horizontal){
                            HStack{
                                
                                ReflectImageView(Placeimage: Image("UbudPlace1"))
                                    .padding(.leading, 20)
                                ReflectImageView(Placeimage: Image("UbudPlace2"))
                                ReflectImageView(Placeimage: Image("UbudPlace3"))
                                ReflectImageView(Placeimage: Image("UbudPlace4"))
                                
                            }
                            .padding(.top,90)
                        }
                        .scrollIndicators(.hidden)
                        
                        AboutANDescripView(descr: "Ubud, located in the uplands of Bali, Indonesia, is renowned for its picturesque landscapes, rich cultural heritage, and vibrant arts scene.")
                        
                        VStack(alignment: .leading){
                                RestaANDarrowView(NameTitle: "Restaurants")
                            ScrollView(.horizontal){
                                HStack {
                                    VStack {
                                        DineInTakeAwayElementView(imageName: Image("UbudRestaurent1"), restaurantName: "Embers Restaurant", phoneNum: "+62 361 9086513", ratingNum: 4.2, showDineIn: "Dine-in .", showTakeaway: " Takeaway .", showDelivery: "No Delivery",restaurantType: "Restaurant")
                                        RestaurantLineView(foregroundColor: .dividerRestau)
                                        DineInTakeAwayElementView(imageName: Image("UbudRestaurent2"), restaurantName: "Ibu Rai Restaurant", phoneNum: "+62 361 973472", ratingNum: 4.3, showDineIn: "Dine-in .", showTakeaway: " Takeaway .", showDelivery: "Delivery",restaurantType: "Asian Restaurant")
                                        RestaurantLineView(foregroundColor: .dividerRestau)
                                        DineInTakeAwayElementView(imageName: Image("UbudRestaurent3"), restaurantName: "Tropical Restaurant Ubud", phoneNum: "+62 361 971122", ratingNum: 4.6, showDineIn: "Dine-in .", showTakeaway: " Takeaway .", showDelivery: "Delivery",restaurantType: "Restaurant")
                                    }
                                    .padding(.leading, 15)
                                    
                                    VStack {
                                        DineInTakeAwayElementView(imageName: Image("UbudRestaurent4"), restaurantName: "Wanara Spice", phoneNum: "+62 822 3664 5774", ratingNum: 4.6, showDineIn: "Dine-in .", showTakeaway: " Kerbside pickup .", showDelivery: "No Delivery",restaurantType: "Restaurant")
//                                        RestaurantLineView()
                                        RestaurantLineView(foregroundColor: .dividerRestau)
                                        DineInTakeAwayElementView(imageName: Image("UbudRestaurent5"), restaurantName: "Birdhill Restaurant", phoneNum: "+62 361 9083887", ratingNum: 4.3, showDineIn: "Dine-in .", showTakeaway: " Takeaway .", showDelivery: "No Delivery",restaurantType: "Restaurant")
//                                        RestaurantLineView()
                                        RestaurantLineView(foregroundColor: .dividerRestau)
                                        DineInTakeAwayElementView(imageName: Image("UbudRestaurent6"), restaurantName: "Wana Restaurant", phoneNum: "+62 812 3754 6966", ratingNum: 5.0, showDineIn: "Dine-in .", showTakeaway: " Takeaway .", showDelivery: "No Delivery",restaurantType: "Restaurant")
                                    }
                                    .padding(.trailing, 15)
                                }
 
                            }
                            
                            MiniMapView(Name: "Ubud")
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                        TitleANDlocationView(placeTitle: "Ubud", locationTitle: "Town in Bali, Indonesia")
                        .ignoresSafeArea()
//                        )
                    }
            }
        }
        .navigationBarHidden(true)
        
    }
}

#Preview {
    UbudPageView()
}





struct ExtractedView: View {
    var body: some View {
        DineInTakeAwayElementView(imageName: Image("UbudRestaurent1"), restaurantName: "Embers Restaurant", phoneNum: "+62 361 9086513", ratingNum: 4.2, showDineIn: "Dine-in .", showTakeaway: " Takeaway .", showDelivery: "No Delivery",restaurantType: "Restaurant")
    }
}
