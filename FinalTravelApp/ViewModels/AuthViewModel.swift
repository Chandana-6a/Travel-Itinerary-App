//
//  AuthViewModel.swift
//  Final Travel App
//
//  Created by chandana on 22/04/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import PhotosUI

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }

    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn( withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
//                    print("Login in..")
        } catch {
            print("DEBUG: failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, username: String) async throws {
        //        print("Created user")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, username: username, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
//            print("Created user")
        } catch{
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut() // signouts in backend
            self.userSession = nil    // wipes out user session and takes back to auth view
            self.currentUser = nil    // wipes out current user data model
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    
    func deleteAccount() async {
        guard let currentUser = Auth.auth().currentUser else { return }
        
        do {
            // Delete user data from Firestore
            let userRef = Firestore.firestore().collection("users").document(currentUser.uid)
            try await userRef.delete()
            
            // Delete user authentication record
            try await currentUser.delete()
            
            // Reset user session and current user
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to delete account with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccountAsync() async {
        //        do {
        //            await deleteAccount()
        //        } catch {
        //            print("DEBUG: Failed to delete account asynchronously with error \(error.localizedDescription)")
        //        }
        await deleteAccount()
    }
    
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            if let userData = try? snapshot.data(as: User.self) {
                self.currentUser = userData
            } else {
                print("DEBUG: Failed to decode user data from Firestore")
            }
        } catch {
            print("DEBUG: Error fetching user data: \(error.localizedDescription)")
        }
    }
    
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentUserUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUserUid).updateData(["ppImageUrl": imageUrl])
        self.currentUser?.ppImageUrl = imageUrl
    }
}
