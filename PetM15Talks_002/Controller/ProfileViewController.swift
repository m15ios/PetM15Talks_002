//
//  ProfileViewController.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 01.01.2022.
//

import UIKit

class ProfileViewController: ViewController {
    
    let appStorage: AppStorage = AppStorage.hole()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //LogoutButton.setTitle("new Title", for: .normal)
        print("logout")
    }
    
    private func showAlert(_ message: String,_ actionCode: String? = nil ) -> Void {
        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
        let btn = UIAlertAction( title: "OK", style: .default ){ _ in
            print( "Button OK is pushed" )
            if actionCode != nil {
                if actionCode! == "Close" {
                    //self.delegate.toScreen("BackToWelcome")
                }
            }
        }
        alert.addAction(btn)
        present(alert, animated: true)
    }
    
    @IBAction func LogoutBTN(_ sender: Any) {
        print("logOut pushed")
        AppStorage.hole().setUserID( "" )
        AppStorage.hole().setUserAuth( false )
        showAlert("Logout successful", "Nothing" )
    }
    

}
