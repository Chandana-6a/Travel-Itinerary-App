//
//  CityDetailedViewModel.swift
//  Final Travel App
//
//  Created by chandana on 19/04/24.


import Foundation
import Firebase

class CDetailViewModel: ObservableObject {
    @Published var cityDetails = [CityDets]()
   
    init() {
        fetchData()
    }
    
    func fetchData() {
        let db = Firestore.firestore()
        
        db.collection("CityView").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error.localizedDescription)")
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("No documents available")
                return
            }

            self.cityDetails = documents.compactMap { document in
                let id = document.documentID
                let CTitle = document.get("CTitle") as? String ?? ""
                let CsubTitle = document.get("CsubTitle") as? String ?? ""
                let miniDesc = document.get("miniDesc") as? String ?? ""
                let PlacesIn = document.get("PlacesIn") as? String ?? ""
                let imagesArr = document.get("imagesArr") as? [String] ?? []
                let PlImages = document.get("PlImages") as? [String] ?? []
                let PlTitle = document.get("PlTitle") as? [String] ?? []
                let PlPhNo = document.get("PlPhNo") as? [String] ?? []
                let PlRating = document.get("PlRating") as? [Double] ?? []
                let PlType = document.get("PlType") as? [String] ?? []
                let RTitle = document.get("RTitle") as? [String] ?? []
                let RImage = document.get("RImage") as? [String] ?? []
                let RPhNo = document.get("RPhNo") as? [String] ?? []
                let RRating = document.get("RRating") as? [Double] ?? []
                let RType = document.get("RType") as? [String] ?? []
                let RTakeAway = document.get("RTakeAway") as? [String] ?? []
                let RDelivery = document.get("RDelivery") as? [String] ?? []
                let DineIn = document.get("DineIn") as? [String] ?? []
                let HTitle = document.get("HTitle") as? [String] ?? []
                let HImage = document.get("HImage") as? [String] ?? []
                let HPhNo = document.get("HPhNo") as? [String] ?? []
                let HStar = document.get("HStar") as? [Int] ?? []
                
                
                return CityDets(id: id, CTitle: CTitle, CsubTitle: CsubTitle, imagesArr: imagesArr, miniDesc: miniDesc, PlacesIn: PlacesIn, PlImages: PlImages, PlTitle: PlTitle, PlPhNo: PlPhNo, PlRating: PlRating, PlType: PlType, RTitle: RTitle, RImage: RImage, RPhNo: RPhNo, RRating: RRating, RType: RType, RTakeAway: RTakeAway, RDelivery: RDelivery, DineIn: DineIn, HTitle: HTitle, HImage: HImage, HPhNo: HPhNo, HStar: HStar)
            }
        }
    }
}

struct CityDets: Identifiable, Codable {
    var id: String
    var CTitle: String
    var CsubTitle: String
    var imagesArr: Array<String>
    var miniDesc: String
    var PlacesIn: String
    var PlImages: Array<String>
    var PlTitle: Array<String>
    var PlPhNo: Array<String>
    var PlRating: Array<Double>
    var PlType: Array<String>
    var RTitle: Array<String>
    var RImage: Array<String>
    var RPhNo: Array<String>
    var RRating: Array<Double>
    var RType: Array<String>
    var RTakeAway: Array<String>
    var RDelivery: Array<String>
    var DineIn: Array<String>
    var HTitle: Array<String>
    var HImage: Array<String>
    var HPhNo: Array<String>
    var HStar: Array<Int>
    
}

