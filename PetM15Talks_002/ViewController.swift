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

