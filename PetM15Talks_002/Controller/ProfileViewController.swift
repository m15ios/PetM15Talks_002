//
//  ProfileViewController.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 01.01.2022.
//

import UIKit

class ProfileViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //LogoutButton.setTitle("new Title", for: .normal)
        print("logout")
    }
    
    
    @IBAction func LogoutBTN(_ sender: Any) {
        print("logOut pushed")
        
    }
    

}
