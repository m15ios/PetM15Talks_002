//
//  Member.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 08.12.2021.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct MemberFields {
    var userEmail: String
    
    func _toDictionary() -> [String:Any]{
        var res = [String:Any]()
        let mirror = Mirror(reflecting: self)
        let properties = Array(mirror.children)
        for i in properties {
            res[ i.label! ] = i.value
        }
        return res
    }
}

struct MemberFormFields {
    var email: String
    var password: String
}

struct ResponseCode {
    var code: Int
    var memberId: String
}

class Member {
    
    static let hole = Member()
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
                        
                        //self?.saveUserDocument(userId: documentId, userData: ["userEmail":data.email] )
                        var memberCard = MemberFields(userEmail:data.email)._toDictionary()
                        self?.saveUserDocument(userId: documentId, userData: memberCard )
                        
                        print("fb uid: \(memberId)")
                        var response = ResponseCode(code: 200, memberId: documentId)
                        print(response)
                        print("----")
                        completion(ResponseCode(code: 200, memberId: documentId))
                    }
                }
            } else {
                let responseError = err! as NSError
                print( responseError.code )
                
                print("oops reg member")
                completion(ResponseCode(code: 404, memberId: ""))
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
    
    func saveUserDocument( userId: String, userData: [String: Any] ){
        Firestore.firestore().collection("Users").document(userId).setData(userData, merge: true)
    }
    
    
    func loginMember( _ data: MemberFormFields, completion: @escaping (ResponseCode)->() ){
        // [weak self] - unload from memory if connect lost
        Auth.auth().signIn(withEmail: data.email, password: data.password){ [weak self] result, err in
            if err == nil {
                if result != nil {
                    if let memberId = result?.user.uid {
                        print("fb uid: \(memberId)")
                        completion(ResponseCode(code: 200, memberId: memberId as String))
                    }
                }
            } else {
                let responseError = err! as NSError
                print( responseError.code )
                print("oops sign in")
                completion(ResponseCode(code: 404, memberId: ""))
            }
        }
    }
    
}
