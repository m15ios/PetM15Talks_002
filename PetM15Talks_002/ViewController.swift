//
//  ViewController.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 07.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


protocol ViewControllerDelegate {
    func toScreen( _ name: String)
}

extension ViewController: ViewControllerDelegate{
    func toScreen( _ name: String ){
        print("try to change screen view to \(name)")
        switch( name ){
            case "AuthViewController":
                let currentStoryboardController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: name) as! AuthViewController
                self.view.insertSubview( currentStoryboardController.view, at: 1)
                break
            case "RegistrationViewController":
                let currentStoryboardController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: name) as! RegistrationViewController
                self.view.insertSubview( currentStoryboardController.view, at: 1)
                break
            default:
                print( "toString switch error" )
                break
        }
        //self.window?.rootViewController = currentStoryboardController
        //self.window?.makeKeyAndVisible()
    }

    
}
