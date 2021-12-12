//
//  AuthViewController.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 11.11.2021.
//

import UIKit

class AuthViewController: ViewController {

    var delegate: ViewControllerDelegate!
    
    /* tap to hide keys */
    /* have to init in didload */
    @IBOutlet weak var backAuthView: UIView!
    var tapMotion: UITapGestureRecognizer?
    @objc func tapBackAuthView(){
        //self.view.endEditing(true)
    }
    
   
    @IBAction func clickBackBTN(_ sender: Any) {
        //print("2222")
        delegate.toScreen("BackToWelcome")
    }
    
    @IBAction func clickAuthBTN(_ sender: Any) {
        print("We try to login")
        if checkFields() {
            print("field validation is done")
        } else {
            print("field validation is fail")
        }
    }
    
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
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

        return result
    }
    
    
    
    override func viewDidLoad() {
        print( "AuthViewController didload" )
        super.viewDidLoad()

        // init tap to backView
        tapMotion = UITapGestureRecognizer(target: self, action: #selector(tapBackAuthView) )
        if tapMotion != nil {
            backAuthView.addGestureRecognizer( tapMotion! )
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
    
    
    /* listenner for get status show\hide keyboard */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    @objc func keyboardWillAppear() {
        print("keyboard on")
    }
    @objc func keyboardWillDisappear() {
        print("keyboard off")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    

}
