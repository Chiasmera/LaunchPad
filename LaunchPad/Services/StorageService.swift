//
//  StorageService.swift
//  LaunchPad
//
//  Created by dmu mac 23 on 30/11/2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

/// Service class responsible for storage of user preferences in the app. Implements the singleton pattern.
class StorageService {
    static let instance = StorageService()
    private let db = Firestore.firestore()
    private var listener : ListenerRegistration?
    private let USERDETAILS = "userdetails"
    private let FAVORITES = "favorites"

    private init() {

    }


    /// Adds the provided ID String to the persisted list of favorites
    /// - Parameter favoriteID: String representing a SpaceXObject ID
    func addFavorite (favoriteID : String) {
        db.collection(FAVORITES).document(favoriteID).setData(["id":favoriteID])
    }
    
    /// Removes the provided ID String from the persisted list of favorites
    /// - Parameter favoriteID: String representing a SpaceXObject ID
    func removeFavorite (favoriteID : String) {
        db.collection(FAVORITES).document(favoriteID).delete()
    }


    /// Adds a listener to the firestore collection tracking favorites. Executes the provided handler upon updates.
    /// - Parameter updateHandler: a function responsible for handling the most recent favorites list provided by the listener
    func addFavoriteListener (updateHandler : @escaping ([String]) -> Void)  {
            listener = db.collection(FAVORITES).addSnapshotListener({ snapshot, error in
                if let error = error {
                    print("error in adding listener to favorite. Reason: \(error.localizedDescription)")
                }

                guard let snapshot else {return }
                updateHandler(snapshot.documents.compactMap({ documentSnap in
                    return documentSnap.documentID
                }))
            })
    }


    /// Removes the current instance of listener on favorites. Should be called on app shutdown
    func removeFavoriteListener () {
        listener?.remove()
    }


    /// Custom error types for the StorageService class
    enum StorageError : Error {
        case emptySnapshot(String)
        case snapshotError(String)
    }

}
