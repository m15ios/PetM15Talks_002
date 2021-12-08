//
//  CheckField.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 07.12.2021.
//

import UIKit

class CheckField {
    
    static let hole = CheckField()
    init() {}
    
    private func isValid( _ type: String, _ data: String ) -> Bool {
        var dataRegEx = ""
        switch type {
            case "email":
                dataRegEx = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,64}"
                break
            default:
                dataRegEx = "(?=.*[a-zA-Z0-9]).{6,}"
                break
        }
        let dataPred = NSPredicate(format: "SELF MATCHES %@", dataRegEx)
        return dataPred.evaluate(with: data)
    }
    
    func validField( _ field1: UITextField,  _ field2: UITextField ) ->Bool {
        if let text1 = field1.text, let text2 = field2.text {
            if text1 == text2 {
                print( "text1: \(text1) == text2: \(text2)" )
                validView( field1, true)
                validView( field2, true)
                return true
            }
        }
        validView( field1, false)
        validView( field2, false)
        return false
    }
    
    func validField( _ field: UITextField ) ->Bool {
        let id = field.restorationIdentifier
        
        switch id {
            /*
            case "name":
                if field.text?.count ?? 0 < 3 {
                    validView( field, false)
                    return false
                } else {
                    validView( field, true)
                    return true
                }
                break
             */
            case "loginField":
                if isValid( "email", field.text! ){
                    validView( field, true)
                    return true
                } else {
                    validView( field, false)
                    return false
                }
                break
            case "passField":
                if isValid( "password", field.text! ){
                    validView( field, true)
                    return true
                } else {
                    validView( field, false)
                    return false
                }
                break
            default:
                if field.text?.count ?? 0 < 2 {
                    validView( field, false)
                    return false
                } else {
                    validView( field, true)
                    return true
                }
                break
            
        }
    }
    
    private func validView( _ field: UITextField, _ valid: Bool ){
        if valid {
            field.backgroundColor = UIColor.white
        } else {
            field.backgroundColor = UIColor.red
        }
    }
    
    
}
