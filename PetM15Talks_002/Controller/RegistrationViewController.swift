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
        print("111")
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
