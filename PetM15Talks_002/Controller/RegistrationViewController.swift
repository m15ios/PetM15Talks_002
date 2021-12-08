//
//  RegistrationViewController.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 11.11.2021.
//

import UIKit

class RegistrationViewController: ViewController {
    
    var delegate: ViewControllerDelegate!
    
    @IBAction func clickJoinBTN(_ sender: Any) {
        print("We try to join")
        if checkFields() {
            print("field validation is done")
            createMember()
        } else {
            print("field validation is fail")
        }
    }
    
    @IBAction func clickBackBTN(_ sender: Any) {
        //print("222")
        delegate.toScreen("BackToWelcome")
    }
    
    /* tap to hide keys */
    @IBOutlet weak var backRegView: UIView!
    var tapMotion: UITapGestureRecognizer?
    @objc func tapBackRegView(){
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repasswordField: UITextField!
    /* field validation */
    var checkField: CheckField = CheckField.hole
    private func checkFields() -> Bool {
        var result: Bool = true
        
        if checkField.validField( loginField ) == false {
            result = false
        }

        if checkField.validField( passwordField ) == false {
            result = false
        }
        
        if checkField.validField( passwordField, repasswordField ) == false {
            result = false
        }

        return result
    }
    
    /* firebase storage */
    var storage: Storage = Storage.hole
    private func createMember(){
        if  let email = loginField.text,
            let password = passwordField.text {
            
            let data = MemberFormFields(email: email, password: password)
            storage.addMember(data){ code in
                switch code.code {
                    case 200:
                        print( "done 200" )
                        break
                    default:
                        print( "error \(code))" )
                        break
                }
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        print("show reg controller")
        super.viewDidLoad()

        // init tap to backView
        tapMotion = UITapGestureRecognizer(target: self, action: #selector(tapBackRegView) )
        if tapMotion != nil {
            backRegView.addGestureRecognizer( tapMotion! )
        }
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
