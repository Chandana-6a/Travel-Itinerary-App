//
//  User.swift
//  Final Travel App
//
//  Created by chandana on 14/04/24.
//


import SwiftUI
import PhotosUI
import Foundation
import FirebaseStorage


struct User: Codable, Identifiable, Hashable{
    let id : String
    let username: String
    let email: String
    var ppImageUrl: String?
}

extension User {
    static var MOCK_USER = User( id: NSUUID().uuidString, username: "Veeru", email: "test@gmail.com", ppImageUrl: "France")
}


class ProfilePhotoViewModel: ObservableObject{
    @Published var selectedItem: PhotosPickerItem?{
        didSet{ Task { try await loadImage() } }
    }
    
    @Published var profileImage: Image?
    
    private var uiImage: UIImage?
    
    func updateUserData() async throws {
        try await updateProfileImage()
    }
    
    @MainActor
    func loadImage() async throws{
        guard let item = selectedItem else { return }
        
        guard let imageData = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imageData) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateProfileImage() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try? await ProfileImageUpload.uploadImage(image) else { return }
        
        let authViewModel = try await AuthViewModel()
        try await authViewModel.updateUserProfileImage(withImageUrl: imageUrl)

    }
}




















//class ProfilePhotoViewModel: ObservableObject {
//    @Published var selectedItem: PhotosPickerItem? {
//        didSet { loadImage() }
//    }
//
//    @Published var profileImage: Image?
//
//    func loadImage() {
//        guard let item = selectedItem else { return }
//        Task {
//            do {
//                guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
//                guard let uiImage = UIImage(data: imageData) else { return }
//                let image = Image(uiImage: uiImage)
//                DispatchQueue.main.async {
//                    self.profileImage = image
//                }
//            } catch {
//                print("DEBUG: Error loading image: \(error.localizedDescription)")
//            }
//        }
//    }
//}

/*class ProfilePhotoViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet { loadImage() }
    }

    @Published var profileImage: Image?

    func loadImage() {
        guard let item = selectedItem else { return }
        Task {
            do {
                guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
                guard let uiImage = UIImage(data: imageData) else { return }
                let image = Image(uiImage: uiImage)
                DispatchQueue.main.async {
                    self.profileImage = image
                }
            } catch {
                print("DEBUG: Error loading image: \(error.localizedDescription)")
            }
        }
    }
}*/



//class ProfilePhotoViewModel: ObservableObject{
//    @Published var selectedItem: PhotosPickerItem?{
//        didSet{ Task { try await loadImage() } }
//    }
//
//    @Published var profileImage: Image?
//
//    func loadImage() async throws{
//        guard let item = selectedItem else { return }
//        guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
//        guard let uiImage = UIImage(data: imageData) else { return }
//        self.profileImage = Image(uiImage: uiImage)
//    }
//}
