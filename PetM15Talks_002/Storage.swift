//
//  Storage.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 08.12.2021.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct MemberFormFields {
    var email: String
    var password: String
}

struct ResponseCode {
    var code: Int
}


class Storage {
    
    static let hole = Storage()
    init() {}
    
    func auth() -> Auth {
        return Auth.auth()
    }
    
    func addMember( _ data: MemberFormFields, completion: @escaping (ResponseCode)->() ){
        // [weak self] - unload from memory if connect lost
        Auth.auth().createUser(withEmail: data.email, password: data.password){ [weak self] result, err in
            if err == nil {
                if result != nil {
                    if let memberId = result?.user.uid {
                        
                        // save userCard to firebase
                        //let email = data.email  as String
                        //let documentData:[String: String] = ["userEmail":email]
                        let documentId = memberId as String
                        self?.saveUserDocument(userId: documentId, userData: ["userEmail":data.email] )
                        
                        print("fb uid: \(memberId)")
                        completion(ResponseCode(code: 200))
                    }
                }
            } else {
                let responseError = err! as NSError
                print( responseError.code )
                
                print("oops")
                completion(ResponseCode(code: 404))
            }
        }
    }
    
    func emailVerification() {
        Auth.auth().currentUser?.sendEmailVerification(completion: { error in
            if error != nil {
                print( "Email verification terminated" )
                print( error!.localizedDescription )
            }
        })
    }
    
    func saveUserDocument( userId: String, userData: [String: String] ){
        Firestore.firestore().collection("Users").document(userId).setData(userData, merge: true)
    }
    
    
}
