//
//  SearchViewModel.swift
//  Final Travel App
//
//  Created by chandana on 16/04/24.
//


import Foundation
import Firebase

class SearchViewModel: ObservableObject {
    @Published var CountriesTitles = [Countries]()
    @Published var searchText = ""
    @Published var selectedCategory: String = "All"

    init() {
        fetchData()
    }

    func fetchData() {
        let db = Firestore.firestore()

        db.collection("placesSearch").getDocuments { (snap, err) in
            if let err = err {
                print("Error getting documents: \(err.localizedDescription)")
                return
            }

            for document in snap!.documents {
                let id = document.documentID
                let COCTitle = document.get("COCTitle") as? String ?? ""
                let location = document.get("location") as? String ?? ""
                let image = document.get("image") as? [String] ?? []
                let imageTitle = document.get("imageTitle") as? [String] ?? []
                let type = document.get("type") as? String ?? ""
                let temp = document.get("temp") as? Int ?? 0
                let isCity = self.isCityLogic(type)
                let category = document.get("category") as? [String] ?? []


                self.CountriesTitles.append(Countries(id: id, COCTitle: COCTitle, location: location, image: image, imageTitle: imageTitle, type: type, isCity: isCity, temp: temp, category: category))
            }
        }
    }

//    func filterCountries() -> [Countries] {
//        if searchText.isEmpty {
//            return CountriesTitles
//        } else {
//            return CountriesTitles.filter { $0.COCTitle.lowercased().contains(searchText.lowercased()) }
//        }
//    }
    
    func filterCountries() -> [Countries] {
        if searchText.isEmpty && selectedCategory == "All" {
            return CountriesTitles
        } else {
            return CountriesTitles.filter { country in
                (searchText.isEmpty || country.COCTitle.lowercased().contains(searchText.lowercased())) &&
                (selectedCategory == "All" || country.category.contains(selectedCategory))
            }
        }
    }
    

    func isCityLogic(_ type: String) -> Bool {
        // Checks if the type is "city" (case insensitive)
        return type.lowercased() == "city"
    }
}


struct Countries: Identifiable {
    var id: String
    var COCTitle: String
    var location: String
    var image: Array<String>
    var imageTitle: Array<String>
    var type: String
    var isCity: Bool
    var temp: Int
    var category: [String]
}


