//
//  Members.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 02.02.2022.
//

//import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class Members {
    
    static let hole = Members()
    init() {}
    
    func getMembersList(completion: @escaping ([String]) -> () ){

        let storage = Firestore.firestore().collection("Users")
        
        storage.getDocuments{ queryResult, error in
            if error == nil {
                var res = [String]()
                if let documents = queryResult?.documents {
                    for document in documents {
                        let data = document.data()
                        //print( data )
                        let email = data["userEmail"] as! String
                        res.append( email )
                    }
                }
                completion( res )
            } else {
                print( "error get members list" )
            }
        }

    }
    
    
}
