//
//  PlaceDetailViewModel.swift
//  Final Travel App
//
//  Created by chandana on 21/04/24.
//

import Foundation
import Firebase

class PlaceDetailViewModel: ObservableObject {
    @Published var placeDetails = [PlaceDets]()
   
    init() {
        fetchData()
    }
    
    func fetchData() {
        let db = Firestore.firestore()
        
        db.collection("PlaceView").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error.localizedDescription)")
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("No documents available")
                return
            }

            self.placeDetails = documents.compactMap { document in
                let id = document.documentID
                let DCityTitle = document.get("DCityTitle") as? String ?? ""
                let DTitle = document.get("DTitle") as? String ?? ""
                let DType = document.get("DType") as? String ?? ""
                let DImage = document.get("DImage") as? String ?? ""
                let DDesc = document.get("DDesc") as? String ?? ""
                let DPhNo = document.get("DPhNo") as? String ?? ""
                let DRating = document.get("DRating") as? Double ?? 0.0
                
                return PlaceDets(id: id, DCityTitle: DCityTitle, DTitle: DTitle, DType: DType, DImage: DImage, DDesc: DDesc, DPhNo: DPhNo, DRating: DRating)
            }
        }
    }
}

struct PlaceDets: Identifiable, Codable {
    var id: String
    var DCityTitle: String
    var DTitle: String
    var DType: String
    var DImage: String
    var DDesc: String
    var DPhNo: String
    var DRating: Double
}
