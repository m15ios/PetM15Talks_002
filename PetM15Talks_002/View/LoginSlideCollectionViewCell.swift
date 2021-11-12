//
//  LoginSlideCollectionViewCell.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 08.11.2021.
//

import UIKit

class LoginSlideCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideMainText: UILabel!
    @IBOutlet weak var slideLoginButton: UIButton!
    @IBOutlet weak var slideJoinButton: UIButton!
    @IBAction func slideLoginBTN(_ sender: Any) {
        toScreen("AuthViewController")
    }
    @IBAction func slideJoinBTN(_ sender: Any) {
        toScreen("RegistrationViewController")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func toScreen( _ name: String ){
        let currentStoryboardController = UIStoryboard(name: name, bundle: nil).instantiateViewController(identifier: name)
        self.window?.rootViewController = currentStoryboardController
        self.window?.makeKeyAndVisible()
    }
    
    func configure( content: LoginSliderItem ){
        slideMainText.text = content.mainText
        
        if( content.hideButtons == true ){
            slideLoginButton.isHidden = true
            slideJoinButton.isHidden = true
        } else {
            slideLoginButton.isHidden = false
            slideJoinButton.isHidden = false
        }
    }

}
